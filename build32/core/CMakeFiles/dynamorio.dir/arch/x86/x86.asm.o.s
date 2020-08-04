# 1 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
# 1 "/home/kumquat/dynamorio/build32/core//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
# 72 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
# 1 "/home/kumquat/dynamorio/core/arch/x86/../asm_defines.asm" 1
# 42 "/home/kumquat/dynamorio/core/arch/x86/../asm_defines.asm"
# 1 "/home/kumquat/dynamorio/build32/configure.h" 1
# 43 "/home/kumquat/dynamorio/core/arch/x86/../asm_defines.asm" 2
# 73 "/home/kumquat/dynamorio/core/arch/x86/x86.asm" 2
.text


# 1 "/home/kumquat/dynamorio/core/unix/os_asm_defines.asm" 1
# 77 "/home/kumquat/dynamorio/core/arch/x86/x86.asm" 2

# 1 "/home/kumquat/dynamorio/core/unix/include/syscall.h" 1
# 22 "/home/kumquat/dynamorio/core/unix/include/syscall.h"
# 1 "/home/kumquat/dynamorio/core/unix/include/syscall_linux_x86.h" 1
# 23 "/home/kumquat/dynamorio/core/unix/include/syscall.h" 2
# 79 "/home/kumquat/dynamorio/core/arch/x86/x86.asm" 2
# 119 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
# 1 "/home/kumquat/dynamorio/core/arch/x86/x86_asm_defines.asm" 1
# 120 "/home/kumquat/dynamorio/core/arch/x86/x86.asm" 2
# 148 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"






















































# 241 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global get_pic_xdi 
.hidden get_pic_xdi 
.type get_pic_xdi, %function
get_pic_xdi:
        mov edi, dword ptr [esp]
        ret
       
# 254 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global call_switch_stack 
.hidden call_switch_stack 
.type call_switch_stack, %function
call_switch_stack:
# 277 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        mov eax, esp


        push ebx
        mov ebx, eax

        push edi
        mov edi, esp

        mov edx, [3*4 + eax]
        mov ecx, [1*4 + eax]
        mov esp, [2*4 + eax]
        cmp dword ptr [4*4 + eax], 0
        je call_dispatch_alt_stack_no_free
        mov eax, [4*4 + eax]
        mov dword ptr [eax], 0
call_dispatch_alt_stack_no_free:
        lea esp, [-4*((1) + 4 - (1)) + esp] 
 mov dword ptr [4*0 + esp], ecx 
 call edx 
 lea esp, [4*((1) + 4 - (1)) + esp]
        mov esp, edi
        mov eax, ebx
        cmp byte ptr [5*4 + eax], 0
        je unexpected_return
        pop edi
        pop ebx







        mov esp, eax

        ret
       
# 332 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global dr_call_on_clean_stack 
.type dr_call_on_clean_stack, %function
dr_call_on_clean_stack:
# 366 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        mov eax, esp





        push ebx
        push ebp
# 382 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        mov ebx, eax
        mov ebp, esp

        mov edx, [2*4 + eax]
        mov ecx, [1*4 + eax]
        mov esp, dword ptr [((10*4 + 24 + ((8)*(64)) + ((8)*(8)))+(8 + 5 * 4)+3*4) + ecx]




        lea esp, [-4*((8) + 4 - (0)) + esp]
        mov ecx, [10*4 + eax]
        mov dword ptr [7*4 + esp], ecx
        mov ecx, [9*4 + eax]
        mov dword ptr [6*4 + esp], ecx
        mov ecx, [8*4 + eax]
        mov dword ptr [5*4 + esp], ecx
        mov ecx, [7*4 + eax]
        mov dword ptr [4*4 + esp], ecx
        mov ecx, [6*4 + eax]
        mov dword ptr [3*4 + esp], ecx
        mov ecx, [5*4 + eax]
        mov dword ptr [2*4 + esp], ecx
        mov ecx, [4*4 + eax]
        mov dword ptr [1*4 + esp], ecx
        mov ecx, [3*4 + eax]
        mov dword ptr [0*4 + esp], ecx
        call edx

        lea esp, [4*((8) + 4 - (0)) + esp]
        mov esp, ebp
        mov ecx, ebx





        pop ebp
        pop ebx
# 430 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        mov esp, ecx

        ret
       
# 442 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global clone_and_swap_stack 
.hidden clone_and_swap_stack 
.type clone_and_swap_stack, %function
clone_and_swap_stack:
        mov eax, dword ptr [ 1*4 + esp]
        mov ecx, dword ptr [ 2*4 + esp]
        mov edx, esp

        push esi
        push edi

        sub ecx, edx
        mov esi, edx
        mov edi, eax
        sub edi, ecx
        sub eax, ecx

        cld
        rep movsb

        pop edi
        pop esi
        mov esp, eax
        ret
       





        .align 0 
.global dr_app_start 
.type dr_app_start, %function
dr_app_start:
        sub esp, 16 - 4


        lea esp, [esp + (- ((8)*(64)) - ((8)*(8)) - 24)] 
 push dword ptr [16 - 4 + esp - (- ((8)*(64)) - ((8)*(8)) - 24)] 
 pushfd 
 pusha 
 lea eax, [esp] 
 lea esp, [-4*((1) + 4 - (1)) + esp] 
 mov dword ptr [4*0 + esp], eax 
 call get_simd_vals 
 lea esp, [4*((1) + 4 - (1)) + esp] 
 lea eax, [(10*4 + 24 + ((8)*(64)) + ((8)*(8))) + esp] 
 mov [(3*4) + esp], eax



        lea eax, [esp]
        lea esp, [-4*((1) + 4 - (1)) + esp] 
 mov dword ptr [4*0 + esp], eax 
 call dr_app_start_helper 
 lea esp, [4*((1) + 4 - (1)) + esp]


        add esp, (10*4 + 24 + ((8)*(64)) + ((8)*(8))) + 16 - 4
        ret
       






        .align 0 
.global dr_app_take_over 
.type dr_app_take_over, %function
dr_app_take_over:
        jmp dynamorio_app_take_over
       







        .align 0 
.global dr_app_running_under_dynamorio 
.type dr_app_running_under_dynamorio, %function
dr_app_running_under_dynamorio:
        mov eax, 0
        ret
       






        .align 0 
.global dynamorio_app_take_over 
.type dynamorio_app_take_over, %function
dynamorio_app_take_over:
        sub esp, 16 - 4


        lea esp, [esp + (- ((8)*(64)) - ((8)*(8)) - 24)] 
 push dword ptr [16 - 4 + esp - (- ((8)*(64)) - ((8)*(8)) - 24)] 
 pushfd 
 pusha 
 lea eax, [esp] 
 lea esp, [-4*((1) + 4 - (1)) + esp] 
 mov dword ptr [4*0 + esp], eax 
 call get_simd_vals 
 lea esp, [4*((1) + 4 - (1)) + esp] 
 lea eax, [(10*4 + 24 + ((8)*(64)) + ((8)*(8))) + esp] 
 mov [(3*4) + esp], eax



        lea eax, [esp]
        lea esp, [-4*((1) + 4 - (1)) + esp] 
 mov dword ptr [4*0 + esp], eax 
 call dynamorio_app_take_over_helper 
 lea esp, [4*((1) + 4 - (1)) + esp]


        add esp, (10*4 + 24 + ((8)*(64)) + ((8)*(8))) + 16 - 4
        ret
       
# 545 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global cleanup_and_terminate 
.hidden cleanup_and_terminate 
.type cleanup_and_terminate, %function
cleanup_and_terminate:
# 569 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        mov ebp, esp

        lea esp, [-3*4 + esp]
# 580 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        call get_pic_xdi
        lea edi, [_GLOBAL_OFFSET_TABLE_ + edi]
        lea eax, [exiting_thread_count @GOTOFF + edi]
        lock inc dword ptr [eax]





        mov ebx, dword ptr [1*4 + ebp]
        mov dword ptr [(((10*4 + 24 + ((8)*(64)) + ((8)*(8)))+(8 + 5 * 4)+3*4)+1*4) + ebx], 1
        lea esp, [-4*((1) + 4 - (1)) + esp] 
 mov dword ptr [4*0 + esp], ebx 
 call is_currently_on_dstack 
 lea esp, [4*((1) + 4 - (1)) + esp]
        cmp al, 0
        jnz cat_save_dstack
        mov ebx, 0
        jmp cat_done_saving_dstack
cat_save_dstack:
        mov ebx, dword ptr [((10*4 + 24 + ((8)*(64)) + ((8)*(8)))+(8 + 5 * 4)+3*4) + ebx]
cat_done_saving_dstack:





        
 call get_cleanup_and_terminate_global_do_syscall_entry 


        lea esp, [-2*4 + esp]

        push ebx
        push eax

        movzx esi, byte ptr [5*4 + ebp]
        cmp esi, 0
        jz cat_thread_only
        
 call dynamo_process_exit 

        jmp cat_no_thread
cat_thread_only:
        
 call dynamo_thread_exit 

cat_no_thread:



        mov ecx, 1


        lea eax, [initstack_mutex @GOTOFF + edi]

cat_spin:

        xchg dword ptr [eax], ecx



        jecxz cat_have_lock

        pause
        jmp cat_spin
cat_have_lock:
# 649 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        mov esi, [2*4 + ebp]
        pop eax
        pop ecx

        lea esp, [2*4 + esp]

        mov ebx, ebp



        lea ebp, [d_r_initstack @GOTOFF + edi]
        mov esp, dword ptr [ebp]
# 679 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        push dword ptr [4*4 + ebx]
        push dword ptr [3*4 + ebx]
        push eax
        push esi

        lea esp, [-2*4 + esp]


        lea esp, [-4*((1) + 4 - (1)) + esp] 
 mov dword ptr [4*0 + esp], ecx 
 call dynamo_thread_stack_free_and_exit 
 lea esp, [4*((1) + 4 - (1)) + esp]

        lea esp, [2*4 + esp]


        pop eax
# 704 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        pop esi







        pop ebx
        pop ecx
# 727 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        lea ebp, [initstack_mutex @GOTOFF + edi]
        mov dword ptr [ebp], 0







        lea ebp, [exiting_thread_count @GOTOFF + edi]
        lock dec dword ptr [ebp]






        jmp esi

       
# 756 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global global_do_syscall_int 
.hidden global_do_syscall_int 
.type global_do_syscall_int, %function
global_do_syscall_int:






        int 0x80






        jmp dynamorio_sys_exit_group

       
# 795 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global global_do_syscall_sysenter 
.hidden global_do_syscall_sysenter 
.type global_do_syscall_sysenter, %function
global_do_syscall_sysenter:
        .byte 0x0f 
 .byte 0x34 







       
# 1132 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global client_int_syscall 
.hidden client_int_syscall 
.type client_int_syscall, %function
client_int_syscall:
        int 0x80
        ret
       
# 1149 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global _start 
.hidden _start 
.type _start, %function
_start:




        cmp edi, 0
        jne reloaded_xfer
        mov eax, esp
        lea esp, [-4*((3) + 4 - (3)) + esp] 
 mov dword ptr [4*2 + esp], eax 
 mov dword ptr [4*1 + esp], 0 
 mov dword ptr [4*0 + esp], 0 
 call relocate_dynamorio 
 lea esp, [4*((3) + 4 - (3)) + esp]
        mov edi, 0

reloaded_xfer:
        xor ebp, ebp






        mov eax, esp



        lea esp, [-4 + esp]
        push esi
        push edi
        push eax

        
 call privload_early_inject 

        jmp unexpected_return
       
# 1190 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global xfer_to_new_libdr 
.hidden xfer_to_new_libdr 
.type xfer_to_new_libdr, %function
xfer_to_new_libdr:

        mov eax, dword ptr [ 1*4 + esp]
        mov ebx, dword ptr [ 2*4 + esp]

        mov edi, dword ptr [ 3*4 + esp]
        mov esi, dword ptr [ 4*4 + esp]

        mov esp, ebx
        jmp eax
       







        .align 0 
.global dynamorio_sigreturn 
.hidden dynamorio_sigreturn 
.type dynamorio_sigreturn, %function
dynamorio_sigreturn:
# 1227 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        mov eax, 0xad


        int 0x80



        jmp unexpected_return
       







        .align 0 
.global dynamorio_sys_exit 
.hidden dynamorio_sys_exit 
.type dynamorio_sys_exit, %function
dynamorio_sys_exit:
# 1288 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        mov ebx, 0
        mov eax, 1

        int 0x80




dynamorio_sys_exit_failed:
        jmp unexpected_return
       






        .align 0 
.global dynamorio_condvar_wake_and_jmp 
.hidden dynamorio_condvar_wake_and_jmp 
.type dynamorio_condvar_wake_and_jmp, %function
dynamorio_condvar_wake_and_jmp:
# 1323 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        push ecx
        mov ebp, 0
        mov edi, 0
        mov esi, 0
        mov edx, 0x7fffffff
        mov ecx, 1
        mov ebx, eax
        mov eax, 240

        int 0x80
        pop ecx
        jmp ecx
# 1370 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
       






        .align 0 
.global dynamorio_sys_exit_group 
.hidden dynamorio_sys_exit_group 
.type dynamorio_sys_exit_group, %function
dynamorio_sys_exit_group:
# 1395 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        mov ebx, 0
        mov eax, 252


        int 0x80



        jmp unexpected_return
       





        .align 0 
.global dynamorio_nonrt_sigreturn 
.hidden dynamorio_nonrt_sigreturn 
.type dynamorio_nonrt_sigreturn, %function
dynamorio_nonrt_sigreturn:
        pop eax
        mov eax, 0x77

        int 0x80


        jmp unexpected_return
       
# 1431 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global master_signal_handler 
.hidden master_signal_handler 
.type master_signal_handler, %function
master_signal_handler:
# 1457 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        mov eax, esp
        lea esp, [-4*((1) + 4 - (2)) + esp] 
 mov dword ptr [4*0 + esp], eax 
 call master_signal_handler_C 
 lea esp, [4*((1) + 4 - (2)) + esp]







        ret


       
# 1565 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global dynamorio_clone 
.hidden dynamorio_clone 
.type dynamorio_clone, %function
dynamorio_clone:
# 1578 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        mov eax, dword ptr [ 6*4 + esp]
        mov ecx, dword ptr [ 2*4 + esp]
        sub ecx, 4
        mov [ecx], eax
        mov edx, dword ptr [ 3*4 + esp]

        push ebx
        push esi
        push edi

        mov ebx, dword ptr [4*4 + esp]
        mov esi, dword ptr [7*4 + esp]
        mov edi, dword ptr [8*4 + esp]
        mov eax, 120

        int 0x80

        cmp eax, 0
        jne dynamorio_clone_parent
        pop ecx
        call ecx

        jmp unexpected_return
dynamorio_clone_parent:


        pop edi
        pop esi
        pop ebx


        ret
       
# 1674 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global back_from_native_retstubs 
.hidden back_from_native_retstubs 
.type back_from_native_retstubs, %function
back_from_native_retstubs:




        .byte 0x6a 
 .byte 0x0 

        jmp short Lback_from_native
        .byte 0x6a 
 .byte 0x1 

        jmp short Lback_from_native
        .byte 0x6a 
 .byte 0x2 

        jmp short Lback_from_native
        .byte 0x6a 
 .byte 0x3 

        jmp short Lback_from_native
        .byte 0x6a 
 .byte 0x4 

        jmp short Lback_from_native
        .byte 0x6a 
 .byte 0x5 

        jmp short Lback_from_native
        .byte 0x6a 
 .byte 0x6 

        jmp short Lback_from_native
        .byte 0x6a 
 .byte 0x7 

        jmp short Lback_from_native
        .byte 0x6a 
 .byte 0x8 

        jmp short Lback_from_native
        .byte 0x6a 
 .byte 0x9 

        jmp short Lback_from_native
.global back_from_native_retstubs_end 
.hidden back_from_native_retstubs_end



back_from_native_retstubs_end:
       






        .align 0 
.global back_from_native 
.hidden back_from_native 
.type back_from_native, %function
back_from_native:


Lback_from_native:





        lea esp, [esp + (- ((8)*(64)) - ((8)*(8)) - 24)] 
 push 0 
 pushfd 
 pusha 
 lea eax, [esp] 
 lea esp, [-4*((1) + 4 - (1)) + esp] 
 mov dword ptr [4*0 + esp], eax 
 call get_simd_vals 
 lea esp, [4*((1) + 4 - (1)) + esp] 
 lea eax, [(10*4 + 24 + ((8)*(64)) + ((8)*(8))) + esp] 
 mov [(3*4) + esp], eax
        lea eax, [esp]
# 1732 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        lea esp, [-4*((1) + 4 - (1)) + esp] 
 mov dword ptr [4*0 + esp], eax 
 call return_from_native 
 lea esp, [4*((1) + 4 - (1)) + esp]

        jmp unexpected_return
       
# 1745 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global native_plt_call 
.hidden native_plt_call 
.type native_plt_call, %function
native_plt_call:
        lea esp, [esp + (- ((8)*(64)) - ((8)*(8)) - 24)] 
 push 0 
 pushfd 
 pusha 
 lea eax, [esp] 
 lea esp, [-4*((1) + 4 - (1)) + esp] 
 mov dword ptr [4*0 + esp], eax 
 call get_simd_vals 
 lea esp, [4*((1) + 4 - (1)) + esp] 
 lea eax, [(10*4 + 24 + ((8)*(64)) + ((8)*(8))) + esp] 
 mov [(3*4) + esp], eax
        lea eax, [esp]



        mov ecx, [esp + (10*4 + 24 + ((8)*(64)) + ((8)*(8)))]
        add dword ptr [eax + ((3*4))], 4

        lea esp, [-4*((2) + 4 - (3)) + esp] 
 mov dword ptr [4*1 + esp], ecx 
 mov dword ptr [4*0 + esp], eax 
 call native_module_callout 
 lea esp, [4*((2) + 4 - (3)) + esp]


        popa 
 popfd 
 lea esp, [esp - (- ((8)*(64)) - ((8)*(8)) - 24) + 4 ]



        ret

       
# 1779 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global dr_try_start 
.type dr_try_start, %function
dr_try_start:
        add dword ptr [ 1*4 + esp], 0
        jmp dr_setjmp
       




        .align 0 
.global dr_setjmp 
.hidden dr_setjmp 
.type dr_setjmp, %function
dr_setjmp:


        mov edx, dword ptr [ 1*4 + esp]
        push edx

        lea esp, [-2*4 + esp]

        lea esp, [-4*((1) + 4 - (1)) + esp] 
 mov dword ptr [4*0 + esp], edx 
 call dr_setjmp_sigmask 
 lea esp, [4*((1) + 4 - (1)) + esp]

        lea esp, [2*4 + esp]

        pop edx



        mov [ 0 + edx], ebx
        mov [ 4 + edx], ecx
        mov [2*4 + edx], edi
        mov [3*4 + edx], esi
        mov [4*4 + edx], ebp
        mov [5*4 + edx], esp
        mov eax, [esp]
        mov [6*4 + edx], eax
# 1823 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        xor eax, eax
        ret
       



        .align 0 
.global dr_longjmp 
.hidden dr_longjmp 
.type dr_longjmp, %function
dr_longjmp:
        mov eax, dword ptr [ 2*4 + esp]
        mov edx, dword ptr [ 1*4 + esp]

        mov ebx, [ 0 + edx]
        mov edi, [2*4 + edx]
        mov esi, [3*4 + edx]
        mov ebp, [4*4 + edx]
        mov esp, [5*4 + edx]
        mov ecx, [6*4 + edx]
        mov [esp], ecx
        mov ecx, [ 4 + edx]
# 1852 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        ret
       
# 1866 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global atomic_swap 
.hidden atomic_swap 
.type atomic_swap, %function
atomic_swap:
        mov eax, dword ptr [ 2*4 + esp]
        mov ecx, dword ptr [ 1*4 + esp]
        xchg [ecx], eax
        ret
       




        .align 0 
.global cpuid_supported 
.hidden cpuid_supported 
.type cpuid_supported, %function
cpuid_supported:
        pushfd
        pop eax
        mov ecx, eax
        xor eax, 0x200000
        push eax
        popfd
        pushfd
        pop eax
        cmp ecx, eax
        mov eax, 0
        setne al
        push ecx
        popfd
        ret
       





        .align 0 
.global our_cpuid 
.hidden our_cpuid 
.type our_cpuid, %function
our_cpuid:
        mov eax, dword ptr [ 1*4 + esp]



        mov ecx, dword ptr [ 3*4 + esp]
        mov edx, dword ptr [ 2*4 + esp]
        push ebx
        push edi

        mov edi, eax
        mov eax, edx
        cpuid
        mov [ 0 + edi], eax
        mov [ 4 + edi], ebx
        mov [ 8 + edi], ecx
        mov [12 + edi], edx
        pop edi
        pop ebx
        ret
       




        .align 0 
.global dr_stmxcsr 
.hidden dr_stmxcsr 
.type dr_stmxcsr, %function
dr_stmxcsr:
        mov eax, dword ptr [ 1*4 + esp]
        stmxcsr [eax]
        ret
       




        .align 0 
.global dr_xgetbv 
.hidden dr_xgetbv 
.type dr_xgetbv, %function
dr_xgetbv:
        mov eax, dword ptr [ 1*4 + esp]
        mov edx, dword ptr [ 2*4 + esp]
        push eax
        push edx
        mov ecx, 0

        .byte 0x0f 
 .byte 0x01 
 .byte 0xd0 

        pop ecx
        mov dword ptr [ecx], eax
        pop ecx
        mov dword ptr [ecx], edx
        ret
       




        .align 0 
.global dr_fxsave 
.hidden dr_fxsave 
.type dr_fxsave, %function
dr_fxsave:
        mov eax, dword ptr [ 1*4 + esp]




        fxsave [eax]

        fnclex
        finit
        ret
       




        .align 0 
.global dr_fnsave 
.hidden dr_fnsave 
.type dr_fnsave, %function
dr_fnsave:
        mov eax, dword ptr [ 1*4 + esp]

        fnsave [eax]
        fwait
        ret
       




        .align 0 
.global dr_fxrstor 
.hidden dr_fxrstor 
.type dr_fxrstor, %function
dr_fxrstor:
        mov eax, dword ptr [ 1*4 + esp]




        fxrstor [eax]

        ret
       




        .align 0 
.global dr_frstor 
.hidden dr_frstor 
.type dr_frstor, %function
dr_frstor:
        mov eax, dword ptr [ 1*4 + esp]
        frstor [eax]
        ret
       
# 2214 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global get_xmm_caller_saved 
.hidden get_xmm_caller_saved 
.type get_xmm_caller_saved, %function
get_xmm_caller_saved:
        mov eax, dword ptr [ 1*4 + esp]
        movups [eax + 0*64], xmm0
        movups [eax + 1*64], xmm1
        movups [eax + 2*64], xmm2
        movups [eax + 3*64], xmm3
        movups [eax + 4*64], xmm4
        movups [eax + 5*64], xmm5

        movups [eax + 6*64], xmm6
        movups [eax + 7*64], xmm7
# 2237 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        ret
       







        .align 0 
.global get_ymm_caller_saved 
.hidden get_ymm_caller_saved 
.type get_ymm_caller_saved, %function
get_ymm_caller_saved:
        mov eax, dword ptr [ 1*4 + esp]
# 2261 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .byte 0xc5 
 .byte 0xfe 
 .byte 0x7f 
 .byte 0x00 

        .byte 0xc5 
 .byte 0xfe 
 .byte 0x7f 
 .byte 0x48 
 .byte 0x40 

        .byte 0xc5 
 .byte 0xfe 
 .byte 0x7f 
 .byte 0x90 
 .byte 0x80 
 .byte 0x00 
 .byte 0x00 
 .byte 0x00 

        .byte 0xc5 
 .byte 0xfe 
 .byte 0x7f 
 .byte 0x98 
 .byte 0xc0 
 .byte 0x00 
 .byte 0x00 
 .byte 0x00 

        .byte 0xc5 
 .byte 0xfe 
 .byte 0x7f 
 .byte 0xa0 
 .byte 0x00 
 .byte 0x01 
 .byte 0x00 
 .byte 0x00 

        .byte 0xc5 
 .byte 0xfe 
 .byte 0x7f 
 .byte 0xa8 
 .byte 0x40 
 .byte 0x01 
 .byte 0x00 
 .byte 0x00 






        .byte 0xc5 
 .byte 0xfe 
 .byte 0x7f 
 .byte 0xb0 
 .byte 0x80 
 .byte 0x01 
 .byte 0x00 
 .byte 0x00 

        .byte 0xc5 
 .byte 0xfe 
 .byte 0x7f 
 .byte 0xb8 
 .byte 0xc0 
 .byte 0x01 
 .byte 0x00 
 .byte 0x00 

# 2295 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        ret
       






        .align 0 
.global get_zmm_caller_saved 
.hidden get_zmm_caller_saved 
.type get_zmm_caller_saved, %function
get_zmm_caller_saved:
        mov eax, dword ptr [ 1*4 + esp]
# 2321 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .byte 0x62 
 .byte 0xf1 
 .byte 0xfe 
 .byte 0x48 
 .byte 0x7f 
 .byte 0x00 

        .byte 0x62 
 .byte 0xf1 
 .byte 0xfe 
 .byte 0x48 
 .byte 0x7f 
 .byte 0x48 
 .byte 0x01 

        .byte 0x62 
 .byte 0xf1 
 .byte 0xfe 
 .byte 0x48 
 .byte 0x7f 
 .byte 0x50 
 .byte 0x02 

        .byte 0x62 
 .byte 0xf1 
 .byte 0xfe 
 .byte 0x48 
 .byte 0x7f 
 .byte 0x58 
 .byte 0x03 

        .byte 0x62 
 .byte 0xf1 
 .byte 0xfe 
 .byte 0x48 
 .byte 0x7f 
 .byte 0x60 
 .byte 0x04 

        .byte 0x62 
 .byte 0xf1 
 .byte 0xfe 
 .byte 0x48 
 .byte 0x7f 
 .byte 0x68 
 .byte 0x05 

        .byte 0x62 
 .byte 0xf1 
 .byte 0xfe 
 .byte 0x48 
 .byte 0x7f 
 .byte 0x70 
 .byte 0x06 

        .byte 0x62 
 .byte 0xf1 
 .byte 0xfe 
 .byte 0x48 
 .byte 0x7f 
 .byte 0x78 
 .byte 0x07 

# 2380 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        ret
       






        .align 0 
.global get_opmask_caller_saved 
.hidden get_opmask_caller_saved 
.type get_opmask_caller_saved, %function
get_opmask_caller_saved:
        mov eax, dword ptr [ 1*4 + esp]
# 2401 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .byte 0xc5 
 .byte 0xf8 
 .byte 0x91 
 .byte 0x00 

        .byte 0xc5 
 .byte 0xf8 
 .byte 0x91 
 .byte 0x48 
 .byte 0x08 

        .byte 0xc5 
 .byte 0xf8 
 .byte 0x91 
 .byte 0x50 
 .byte 0x10 

        .byte 0xc5 
 .byte 0xf8 
 .byte 0x91 
 .byte 0x58 
 .byte 0x18 

        .byte 0xc5 
 .byte 0xf8 
 .byte 0x91 
 .byte 0x60 
 .byte 0x20 

        .byte 0xc5 
 .byte 0xf8 
 .byte 0x91 
 .byte 0x68 
 .byte 0x28 

        .byte 0xc5 
 .byte 0xf8 
 .byte 0x91 
 .byte 0x70 
 .byte 0x30 

        .byte 0xc5 
 .byte 0xf8 
 .byte 0x91 
 .byte 0x78 
 .byte 0x38 

        ret
       





        .align 0 
.global hashlookup_null_handler 
.hidden hashlookup_null_handler 
.type hashlookup_null_handler, %function
hashlookup_null_handler:







        jmp .+130



       





.global safe_read_asm_pre 
.hidden safe_read_asm_pre
.global safe_read_asm_mid 
.hidden safe_read_asm_mid
.global safe_read_asm_post 
.hidden safe_read_asm_post
.global safe_read_asm_recover 
.hidden safe_read_asm_recover
# 2452 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        .align 0 
.global safe_read_asm 
.hidden safe_read_asm 
.type safe_read_asm, %function
safe_read_asm:
        mov eax, dword ptr [ 1*4 + esp] 
 mov ecx, dword ptr [ 2*4 + esp] 
 mov edx, dword ptr [ 3*4 + esp] 
 push edi 
 push esi 
 mov edi, eax 
 mov esi, ecx

        mov ecx, esi 
 and ecx, (4 - 1) 
 jz safe_read_asm_aligned 
 neg ecx 
 add ecx, 4 
 cmp edx, ecx 
 cmovb ecx, edx 
 sub edx, ecx 
safe_read_asm_pre: 
 rep movsb 
safe_read_asm_aligned: 
 
 mov ecx, edx 
 shr ecx, 2 
safe_read_asm_mid: 
 rep movsd 
 
 mov ecx, edx 
 and ecx, (4 - 1) 
safe_read_asm_post: 
 rep movsb
safe_read_asm_recover:
        mov eax, esi
        pop esi 
 pop edi
        ret
       


.global safe_read_tls_magic 
.hidden safe_read_tls_magic
.global safe_read_tls_magic_recover 
.hidden safe_read_tls_magic_recover
.global safe_read_tls_self 
.hidden safe_read_tls_self
.global safe_read_tls_self_recover 
.hidden safe_read_tls_self_recover
.global safe_read_tls_app_self 
.hidden safe_read_tls_app_self
.global safe_read_tls_app_self_recover 
.hidden safe_read_tls_app_self_recover

        .align 0 
.global safe_read_tls_magic 
.hidden safe_read_tls_magic 
.type safe_read_tls_magic, %function
safe_read_tls_magic:



        fs
        mov eax, dword ptr [48]
safe_read_tls_magic_recover:

        ret
       

        .align 0 
.global safe_read_tls_self 
.hidden safe_read_tls_self 
.type safe_read_tls_self, %function
safe_read_tls_self:

        fs
        mov eax, dword ptr [44]
safe_read_tls_self_recover:

        ret
       

        .align 0 
.global safe_read_tls_app_self 
.hidden safe_read_tls_app_self 
.type safe_read_tls_app_self, %function
safe_read_tls_app_self:

        gs
        mov eax, dword ptr [8]
safe_read_tls_app_self_recover:

        ret
       






        .align 0 
.global _dynamorio_runtime_resolve 
.hidden _dynamorio_runtime_resolve 
.type _dynamorio_runtime_resolve, %function
_dynamorio_runtime_resolve:
# 2537 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"
        push eax
        push ecx
        mov eax, [esp + 2 * 4]
        mov ecx, [esp + 3 * 4]



        lea esp, [-4*((2) + 4 - (2)) + esp] 
 mov dword ptr [4*1 + esp], ecx 
 mov dword ptr [4*0 + esp], eax 
 call dynamorio_dl_fixup 
 lea esp, [4*((2) + 4 - (2)) + esp]



        mov [esp + 2 * 4], eax
        pop ecx
        pop eax
        ret 4

       
# 2708 "/home/kumquat/dynamorio/core/arch/x86/x86.asm"

