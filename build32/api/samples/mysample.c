/* ******************************************************************************
 * Copyright (c) 2013-2015 Google, Inc.  All rights reserved.
 * ******************************************************************************/

/*
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * * Neither the name of VMware, Inc. nor the names of its contributors may be
 *   used to endorse or promote products derived from this software without
 *   specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL VMWARE, INC. OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 */

/* Code Manipulation API Sample:
 * bbbuf.c
 *
 * This sample demonstrates how to use a TLS field for per-thread profiling.
 * For each thread, we create a 64KB buffer with 64KB-aligned start address,
 * and store that into a TLS slot.
 * At the beginning of each basic block, we insert code to
 * - load the pointer from the TLS slot,
 * - store the starting pc of the basic block into the buffer,
 * - update the pointer by incrementing just the low 16 bits of the pointer
 *   so we will fill the buffer in a cyclical way.
 * This is all done via the fast circular buffer code provided by the drx_buf
 * extension.
 * This sample can be used for hot path profiling or debugging with execution
 * history.
 */
#include "utils.h"
#include "dr_api.h"
#include "drmgr.h"
#include "drreg.h"
#include "drx.h"
#include <string.h>
#include <stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/ipc.h>
#include<sys/shm.h>
#include <sys/wait.h>  
#include <unistd.h>  
#include <signal.h>
#include <sys/time.h>

#define SHM_ENV_VAR         "__AFL_SHM_ID"
#define MAP_SIZE            (1 << 28)
/* drx_buf makes our work easy as it already has first-class support for the
 * fast circular buffer.
 */
// static drx_buf_t *buf;
static char *id_str;
// static key_t my_key;
static int shm_id;
static unsigned char *shm_trace_ptr;
// static int trace_shm;
static module_data_t *target_module=NULL;
static unsigned int allcount = 1;
struct itimerval new_value;

static void 
at_bb(app_pc bb_addr)
{
    // dr_printf("###0x%x###\n",bb_addr-target_module->start);

    unsigned int *addr_ptr = (unsigned int *)shm_trace_ptr;
    addr_ptr[allcount] = bb_addr-target_module->start;
    allcount++;
    addr_ptr[0] = allcount -1;
    // dr_printf("%d %x\n",allcount,bb_addr);
    // 序列长度超过共享内存长度就退出
    if (allcount>=MAP_SIZE/4) 
    {
        addr_ptr[0] = allcount -1;
        shmdt(shm_trace_ptr);
        dr_printf("bb count overflow %d\n",allcount);
        // drx_buf_free(buf);
        drmgr_exit();
        drx_exit();
        exit(1);
    }
}
static dr_emit_flags_t
event_app_instruction(void *drcontext, void *tag, instrlist_t *bb, instr_t *inst,
                      bool for_trace, bool translating, void *user_data)
{
    // app_pc pc = dr_fragment_app_pc(tag);
    // reg_id_t reg;
    // /* We need a 2nd scratch reg for several operations on AArch32 and AArch64 only. */
    // reg_id_t reg2 = DR_REG_NULL;

    /* By default drmgr enables auto-predication, which predicates all instructions with
     * the predicate of the current instruction on ARM.
     * We disable it here because we want to unconditionally execute the following
     * instrumentation.
     */
    drmgr_disable_auto_predication(drcontext, bb);

    /* We do all our work at the start of the block prior to the first instr */
    if (!drmgr_is_first_instr(drcontext, inst))
        return DR_EMIT_DEFAULT;
    // dr_printf("0x%x\n",instr_get_app_pc(inst)) ;
    app_pc bb_addr = instr_get_app_pc(inst);
    
    if(target_module)
    {
        if(bb_addr>=target_module->start && bb_addr<=target_module->end)
        {
            
            // dr_printf("event ###0x%x###\n",bb_addr-target_module->start);
            dr_insert_clean_call(drcontext,bb,instrlist_first_app(bb),(void *)at_bb,false,1,OPND_CREATE_INT32(bb_addr));
            // 
        }
    }


    return DR_EMIT_DEFAULT;
}

// static void
// event_thread_init(void *drcontext)
// {
//     byte *data;

//     data = drx_buf_get_buffer_ptr(drcontext, buf);
//     memset(data, 0, DRX_BUF_FAST_CIRCULAR_BUFSZ);
// }
static void set_main_target_module()
{
    module_data_t *info = dr_get_main_module();
    target_module = malloc(sizeof(module_data_t));
    memset(target_module,0,sizeof(module_data_t));
    memcpy(target_module,info,sizeof(module_data_t));
    dr_printf("set_main_target_module\n");
}
static void
set_up_shm()
{
    // my_key = ftok("/tmp/temp.c",123);

    id_str = getenv(SHM_ENV_VAR),
    shm_id = atoi(id_str);
    shm_trace_ptr = (unsigned char*)shmat(shm_id,NULL,0);
    if(shm_trace_ptr == (void*)-1)
    {
        dr_printf("Get SHM Failed\n");
        exit(1);
    }
    dr_printf("set_up_shm\n");


    // trace_shm = shmget(my_key,1024,0666);
    // if(trace_shm == -1)
    // {
    //     printf("Shmget error!\n");
    //     exit(1);
    // }
    // shm_trace_ptr = (unsigned char*)shmat(trace_shm,NULL,0);
}

static void
event_exit(void)
{
    unsigned int *addr_ptr = (unsigned int *)shm_trace_ptr;
    addr_ptr[0] = allcount -1;
    dr_printf("my sample exit executed %d\n",allcount);
    if (!drmgr_unregister_bb_insertion_event(event_app_instruction) ||
        drreg_exit() != DRREG_SUCCESS)
        DR_ASSERT(false);
    // unload shm 
    shmdt(shm_trace_ptr);
    
    // drx_buf_free(buf);
    drmgr_exit();
    drx_exit();
}
// static dr_signal_action_t
// event_signal(void *drcontext, dr_siginfo_t *info)
// {
//     dr_printf("singal %d\n",info->sig);
//     return DR_SIGNAL_DELIVER;
// }
// static void
// event_module_load(void *drcontext, const module_data_t *info, bool loaded)
// {
//     dr_printf("module %s loaded at 0x%x -- 0x%x in %s \n",dr_module_preferred_name(info),info->start,info->end,info->full_path);
//     // if(strcmp(dr_module_preferred_name(info),"listswf") ==0)
//     // {
//     //     target_module = malloc(sizeof(module_data_t));
//     //     memset(target_module,0,sizeof(module_data_t));
//     //     memcpy(target_module,info,sizeof(module_data_t));
//     // }
// }

// static void
// event_module_unload(void *drcontext, const module_data_t *info)
// {
//     dr_printf("module %s exits\n",dr_module_preferred_name(info));
// }
// static void timeoutHandler()
// {
//     unsigned int *addr_ptr = (unsigned int *)shm_trace_ptr;
//     addr_ptr[0] = allcount -1;
//     dr_printf("timeout\n");
//     if (!drmgr_unregister_bb_insertion_event(event_app_instruction) ||
//         drreg_exit() != DRREG_SUCCESS)
//         DR_ASSERT(false);
//     // unload shm 
//     shmdt(shm_trace_ptr);
    
//     // drx_buf_free(buf);
//     drmgr_exit();
//     drx_exit();
// }

DR_EXPORT void
dr_client_main(client_id_t id, int argc, const char *argv[])
{

    drreg_options_t ops = { sizeof(ops), 2 /*max slots needed*/, false };
    dr_set_client_name("DynamoRIO Sample Client 'mysample'", "http://dynamorio.org/issues");
    
    int client_argc;
    const char **client_argv=NULL;
    dr_printf("begin\n");
    // const char *options = dr_get_options(id);
    if(!dr_get_option_array(id, &client_argc, &client_argv)) dr_printf("Error get so args\n");
    // for(int i=0;i<client_argc;i++) dr_printf("arg %d is %s\n",i,client_argv[i]);
    
    if (!drmgr_init() || !drx_init() || drreg_init(&ops) != DRREG_SUCCESS)
        DR_ASSERT(false);
    
    set_main_target_module();
    set_up_shm();
    // buf = drx_buf_create_circular_buffer(DRX_BUF_FAST_CIRCULAR_BUFSZ);
    // DR_ASSERT(buf);
    /* register events */
    dr_register_exit_event(event_exit);
    // drmgr_register_signal_event(event_signal);

    // signal(SIGHUP, timeoutHandler);
    // signal(SIGINT, timeoutHandler);
    // signal(SIGTERM, timeoutHandler);
    // signal(SIGALRM, timeoutHandler);
    // new_value.it_value.tv_sec = 0;
    // // time out value 300ms
    // new_value.it_value.tv_usec = 300000;
    // setitimer(ITIMER_REAL, &new_value, NULL);

    if (!drmgr_register_bb_instrumentation_event(NULL, event_app_instruction, NULL))
        // ||!drmgr_register_module_load_event(event_module_load)
        // ||!drmgr_register_module_unload_event(event_module_unload))
        DR_ASSERT(false);
    
}
