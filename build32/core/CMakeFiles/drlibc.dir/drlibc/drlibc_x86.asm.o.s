# 1 "/home/kumquat/dynamorio/core/drlibc/drlibc_x86.asm"
# 1 "/home/kumquat/dynamorio/build32/core//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "/home/kumquat/dynamorio/core/drlibc/drlibc_x86.asm"
# 43 "/home/kumquat/dynamorio/core/drlibc/drlibc_x86.asm"
# 1 "/home/kumquat/dynamorio/core/drlibc/../arch/asm_defines.asm" 1
# 42 "/home/kumquat/dynamorio/core/drlibc/../arch/asm_defines.asm"
# 1 "/home/kumquat/dynamorio/build32/configure.h" 1
# 43 "/home/kumquat/dynamorio/core/drlibc/../arch/asm_defines.asm" 2
# 44 "/home/kumquat/dynamorio/core/drlibc/drlibc_x86.asm" 2
# 1 "/home/kumquat/dynamorio/core/drlibc/../arch/x86/x86_asm_defines.asm" 1
# 45 "/home/kumquat/dynamorio/core/drlibc/drlibc_x86.asm" 2



.text


# 61 "/home/kumquat/dynamorio/core/drlibc/drlibc_x86.asm"
        .align 0 
.global dynamorio_syscall 
.hidden dynamorio_syscall 
.type dynamorio_syscall, %function
dynamorio_syscall:

        push ebx
# 95 "/home/kumquat/dynamorio/core/drlibc/drlibc_x86.asm"
        push ebp
        push esi
        push edi





        mov ecx, [16+ 8 + esp]
        cmp ecx, 0
        je syscall_0args
        cmp ecx, 1
        je syscall_1args
        cmp ecx, 2
        je syscall_2args
        cmp ecx, 3
        je syscall_3args
        cmp ecx, 4
        je syscall_4args
        cmp ecx, 5
        je syscall_5args
# 129 "/home/kumquat/dynamorio/core/drlibc/drlibc_x86.asm"
        mov ebp, [16+32 + esp]
syscall_5args:
        mov edi, [16+28 + esp]
syscall_4args:
        mov esi, [16+24 + esp]
syscall_3args:
        mov edx, [16+20 + esp]
syscall_2args:
        mov ecx, [16+16 + esp]
syscall_1args:
        mov ebx, [16+12 + esp]
syscall_0args:
# 167 "/home/kumquat/dynamorio/core/drlibc/drlibc_x86.asm"
        mov eax, [16+ 4 + esp]
# 176 "/home/kumquat/dynamorio/core/drlibc/drlibc_x86.asm"
        int 0x80



        pop edi
        pop esi
        pop ebp

        pop ebx
# 193 "/home/kumquat/dynamorio/core/drlibc/drlibc_x86.asm"
        ret
       
# 366 "/home/kumquat/dynamorio/core/drlibc/drlibc_x86.asm"
        .align 0 
.global dr_fpu_exception_init 
.hidden dr_fpu_exception_init 
.type dr_fpu_exception_init, %function
dr_fpu_exception_init:
        fninit
        push 0x1f80
        ldmxcsr dword ptr [esp]
        pop eax
        ret
       






        .align 0 
.global get_mmx_val 
.hidden get_mmx_val 
.type get_mmx_val, %function
get_mmx_val:
        mov eax, dword ptr [ 1*4 + esp]
        mov ecx, dword ptr [ 2*4 + esp]
       
        cmp ecx, 0
        je get_mmx_0
        cmp ecx, 1
        je get_mmx_1
        cmp ecx, 2
        je get_mmx_2
        cmp ecx, 3
        je get_mmx_3
        cmp ecx, 4
        je get_mmx_4
        cmp ecx, 5
        je get_mmx_5
        cmp ecx, 6
        je get_mmx_6
        movq qword ptr [eax], mm7
        jmp get_mmx_done
get_mmx_6:
        movq qword ptr [eax], mm6
        jmp get_mmx_done
get_mmx_5:
        movq qword ptr [eax], mm5
        jmp get_mmx_done
get_mmx_4:
        movq qword ptr [eax], mm4
        jmp get_mmx_done
get_mmx_3:
        movq qword ptr [eax], mm3
        jmp get_mmx_done
get_mmx_2:
        movq qword ptr [eax], mm2
        jmp get_mmx_done
get_mmx_1:
        movq qword ptr [eax], mm1
        jmp get_mmx_done
get_mmx_0:
        movq qword ptr [eax], mm0
get_mmx_done:
        add esp, 0
        ret
       
# 724 "/home/kumquat/dynamorio/core/drlibc/drlibc_x86.asm"

