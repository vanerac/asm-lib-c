BITS 64

SECTION .text

GLOBAL strstr

strstr:
    mov rax, 0
    jmp strstr_loop

strstr_loop:
    mov cl, BYTE [rdi]
    cmp cl, 0
    je strstr_end
    mov r8, rdi
    mov r9, rsi
    cmp cl, BYTE [rsi]
    je strstr_cmp
    jmp strstr_inc

strstr_inc:
    inc rdi
    jmp strstr_loop

strstr_cmp:
    mov cl, BYTE [r9]
    cmp cl, 0
    je strstr_end
    cmp cl, BYTE [r9]
    jne strstr_inc
    inc r8
    inc r9
    jmp strstr_cmp

strstr_end:
    mov rax, rdi
    ret