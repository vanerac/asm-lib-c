strlen:
    ; Init
    mov rax, 0 ; rax = 0
    jmp strlen_loop

strlen_loop:
    mov cl, BYTE [rdi]
    cmp cl, 0
    jne strlen_inc
    ret

strlen_inc:
    inc rdi ; ptr++
    inc rax ; increment
    jmp strlen_loop;