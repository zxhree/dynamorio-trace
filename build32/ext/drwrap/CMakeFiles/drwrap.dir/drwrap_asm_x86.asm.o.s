# 1 "/home/kumquat/dynamorio/ext/drwrap/drwrap_asm_x86.asm"
# 1 "/home/kumquat/dynamorio/build32/ext/drwrap//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "/home/kumquat/dynamorio/ext/drwrap/drwrap_asm_x86.asm"
# 37 "/home/kumquat/dynamorio/ext/drwrap/drwrap_asm_x86.asm"
# 1 "/home/kumquat/dynamorio/build32/cmake/cpp2asm_defines.h" 1
# 38 "/home/kumquat/dynamorio/ext/drwrap/drwrap_asm_x86.asm" 2

.text





# 53 "/home/kumquat/dynamorio/ext/drwrap/drwrap_asm_x86.asm"
        .align 0 
.global replace_native_xfer 
.hidden replace_native_xfer 
.type replace_native_xfer, %function
replace_native_xfer:
# 68 "/home/kumquat/dynamorio/ext/drwrap/drwrap_asm_x86.asm"
        push 0
        push eax
        push edx
        
 call replace_native_xfer_stack_adjust 

        mov ecx, eax
        pop edx
        pop eax
        lea esp, [ 4 + esp ]




        mov dword ptr [-2 * 4 + esp], 0
        mov dword ptr [-1 * 4 + esp], 0


        sub esp, ecx

        push eax

        push eax
        push edx





        push ebx
        mov ebx, esp
        and esp, -16


        
 call replace_native_xfer_app_retaddr 

        mov dword ptr [3 * 4 + ebx], eax


        
 call replace_native_xfer_target 

        mov ecx, eax

        mov esp, ebx
        pop ebx

        pop edx
        pop eax




        mov dword ptr [-2 * 4 + esp], 0
        mov dword ptr [-1 * 4 + esp], 0
        jmp ecx

        ret
       
# 131 "/home/kumquat/dynamorio/ext/drwrap/drwrap_asm_x86.asm"
.global replace_native_ret_imms 
.hidden replace_native_ret_imms
.global replace_native_ret_imms_end 
.hidden replace_native_ret_imms_end

        .align 0 
.global replace_native_rets 
.hidden replace_native_rets 
.type replace_native_rets, %function
replace_native_rets:
        ret
replace_native_ret_imms:
        ret 1 * 4
        ret 2 * 4
        ret 3 * 4
        ret 4 * 4
        ret 5 * 4
        ret 6 * 4
        ret 7 * 4
        ret 8 * 4
        ret 9 * 4
        ret 10 * 4
        ret 11 * 4
        ret 12 * 4
        ret 13 * 4
        ret 14 * 4
        ret 15 * 4
        ret 16 * 4
        ret 17 * 4
        ret 18 * 4
        ret 19 * 4
        ret 20 * 4
        ret 21 * 4
        ret 22 * 4
        ret 23 * 4
        ret 24 * 4
        ret 25 * 4
        ret 26 * 4
        ret 27 * 4
        ret 28 * 4
        ret 29 * 4
        ret 30 * 4
        ret 31 * 4
        ret 32 * 4
        ret 33 * 4
        ret 34 * 4
        ret 35 * 4
        ret 36 * 4
        ret 37 * 4
        ret 38 * 4
        ret 39 * 4
        ret 40 * 4
replace_native_ret_imms_end:
        nop
       







        .align 0 
.global replace_retaddr_sentinel 
.hidden replace_retaddr_sentinel 
.type replace_retaddr_sentinel, %function
replace_retaddr_sentinel:
        ret
       



