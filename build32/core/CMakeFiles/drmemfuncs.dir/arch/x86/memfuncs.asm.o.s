# 1 "/home/kumquat/dynamorio/core/arch/x86/memfuncs.asm"
# 1 "/home/kumquat/dynamorio/build32/core//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "/home/kumquat/dynamorio/core/arch/x86/memfuncs.asm"
# 59 "/home/kumquat/dynamorio/core/arch/x86/memfuncs.asm"
# 1 "/home/kumquat/dynamorio/core/arch/x86/../asm_defines.asm" 1
# 42 "/home/kumquat/dynamorio/core/arch/x86/../asm_defines.asm"
# 1 "/home/kumquat/dynamorio/build32/configure.h" 1
# 43 "/home/kumquat/dynamorio/core/arch/x86/../asm_defines.asm" 2
# 60 "/home/kumquat/dynamorio/core/arch/x86/memfuncs.asm" 2
# 1 "/home/kumquat/dynamorio/core/arch/x86/x86_asm_defines.asm" 1
# 61 "/home/kumquat/dynamorio/core/arch/x86/memfuncs.asm" 2
.text
# 82 "/home/kumquat/dynamorio/core/arch/x86/memfuncs.asm"
        .align 0 
.global memcpy 
.hidden memcpy 
.type memcpy, %function




        .weak memcpy
memcpy:
        mov eax, dword ptr [ 1*4 + esp] 
 mov ecx, dword ptr [ 2*4 + esp] 
 mov edx, dword ptr [ 3*4 + esp] 
 push edi 
 push esi 
 mov edi, eax 
 mov esi, ecx
        mov eax, edi

        mov ecx, esi 
 and ecx, (4 - 1) 
 jz memcpy_aligned 
 neg ecx 
 add ecx, 4 
 cmp edx, ecx 
 cmovb ecx, edx 
 sub edx, ecx 
memcpy_pre: 
 rep movsb 
memcpy_aligned: 
 
 mov ecx, edx 
 shr ecx, 2 
memcpy_mid: 
 rep movsd 
 
 mov ecx, edx 
 and ecx, (4 - 1) 
memcpy_post: 
 rep movsb
        pop esi 
 pop edi
        ret
       



        .align 0 
.global memset 
.hidden memset 
.type memset, %function

        .weak memset
memset:
        mov eax, dword ptr [ 1*4 + esp] 
 mov ecx, dword ptr [ 2*4 + esp] 
 mov edx, dword ptr [ 3*4 + esp] 
 push edi 
 push esi 
 mov edi, eax 
 mov esi, ecx
        push edi
        test esi, esi
        jnz make_val_word_size
        xor eax, eax
do_memset:

        mov ecx, edi 
 and ecx, (4 - 1) 
 jz memset_aligned 
 neg ecx 
 add ecx, 4 
 cmp edx, ecx 
 cmovb ecx, edx 
 sub edx, ecx 
memset_pre: 
 rep stosb 
memset_aligned: 
 
 mov ecx, edx 
 shr ecx, 2 
memset_mid: 
 rep stosd 
 
 mov ecx, edx 
 and ecx, (4 - 1) 
memset_post: 
 rep stosb
        pop eax
        pop esi 
 pop edi
        ret


make_val_word_size:
        and esi, 0xff



        mov eax, 0x01010101


        imul eax, esi
        jmp do_memset
       
# 135 "/home/kumquat/dynamorio/core/arch/x86/memfuncs.asm"
.global __memcpy_chk
.hidden __memcpy_chk
.weak __memcpy_chk
.set __memcpy_chk,memcpy

.global __memset_chk
.hidden __memset_chk
.weak __memset_chk
.set __memset_chk,memset






