BITS 64

SECTION .text

GLOBAL strpbrk

strpbrk:
    mov rax, 0
    jmp strpbrk_loop


strpbrk_loop:
    mov cl, BYTE [rdi] ; copy byte
    mov r8, rsi
    jmp strpbrk_inc

strpbrk_jmp:
    inc rdi
    mov r8, rsi
    jmp strpbrk_loop

strpbrk_inc:
    cmp cl, 0
    je strpbrk_end
    cmp cl, BYTE [r8]
    je strpbrk_end
    cmp BYTE [r8], 0
    je strpbrk_jmp
    inc r8
    jmp strpbrk_inc

strpbrk_end:
    mov rax, rdi
    ret