BITS 64

SECTION .text

GLOBAL strchr

strchr:
    cmp BYTE [rdi], 0 ; if null
    je strchr_end_f
    cmp BYTE [rdi], sil ; if found
    je strchr_end

    inc rdi ; increment
    jmp strchr

strchr_end_f:
    mov rax, 0
    ret


strchr_end:
    mov rax, rdi
    ret
