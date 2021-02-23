rindex:
    ; Init
    mov rax, 0 ; cpy inital ptr
    jmp rindex_loop

rindex_loop:
    mov cl, BYTE [rdi] ; cpy byte

    cmp cl, 0
    je rindex_end ; ret null if null

    cmp cl, sil ; compare to searched
    je rindex_save

    inc rdi ; increment
    jmp rindex_loop;

rindex_save:
    mov rax, rdi

rindex_fail:
    mov rax, 0
    ret

rindex_end:
    mov cl, BYTE [rax]
    cmp cl, sil
    jne rindex_fail
    ret

rindex_inc:
    inc rdi ; increment
    jmp rindex_loop;