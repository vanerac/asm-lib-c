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
    inc rdi
    mov cl, BYTE [rdi]
    cmp cl, 0
    je strpbrk_end
    jmp strpbrk_loop

strpbrk_inc:
    cmp cl, BYTE [r8]
    cmp cl, 0
    je strpbrk_loop
    inc r8
    jmp strpbrk_inc

strpbrk_end:
    mov rax, rdi
    ret