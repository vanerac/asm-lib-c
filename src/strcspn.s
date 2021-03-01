BITS 64

SECTION .text

GLOBAL strcspn

strcspn:
    mov rax, 0
    jmp strcspn_loop

strcspn_loop:
    mov cl, BYTE [rdi]
    cmp cl, BYTE [rsi]
    je strcspn_end
    inc rax
    inc rdi
    inc rsi
    jmp strcspn_loop


strcspn_end:
    ret