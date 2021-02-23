strchr:
    ; Init
    mov rax, rdi ; cpy inital ptr
    jmp strchr_loop

strchr_loop:
    mov cl, BYTE [rax] ; cpy byte
    cmp cl, 0
    je strchr_end ; ret null if null

    cmp cl, sil ; compare to searched
    jne strchr_inc
    ret

strchr_end:
    mov rax, 0
    ret

strchr_inc:
    inc rax ; increment
    jmp strchr_loop;