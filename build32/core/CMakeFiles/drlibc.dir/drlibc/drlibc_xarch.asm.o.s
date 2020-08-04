# 1 "/home/kumquat/dynamorio/core/drlibc/drlibc_xarch.asm"
# 1 "/home/kumquat/dynamorio/build32/core//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "/home/kumquat/dynamorio/core/drlibc/drlibc_xarch.asm"
# 37 "/home/kumquat/dynamorio/core/drlibc/drlibc_xarch.asm"
# 1 "/home/kumquat/dynamorio/core/drlibc/../arch/asm_defines.asm" 1
# 42 "/home/kumquat/dynamorio/core/drlibc/../arch/asm_defines.asm"
# 1 "/home/kumquat/dynamorio/build32/configure.h" 1
# 43 "/home/kumquat/dynamorio/core/drlibc/../arch/asm_defines.asm" 2
# 38 "/home/kumquat/dynamorio/core/drlibc/drlibc_xarch.asm" 2
.text











        .align 0 
.global unexpected_return 
.hidden unexpected_return 
.type unexpected_return, %function
unexpected_return:
        lea esp, [-4*((3) + 4 - (3)) + esp] 
 mov dword ptr [4*2 + esp], 0x0 
 mov dword ptr [4*1 + esp], 0x0 
 mov dword ptr [4*0 + esp], 0x0 
 call d_r_internal_error 
 lea esp, [4*((3) + 4 - (3)) + esp]




        jmp unexpected_return
       



