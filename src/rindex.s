BITS 64

SECTION .text

GLOBAL rindex

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
    inc rdi ; increment
    jmp rindex_loop

rindex_end:
    ret

rindex_inc:
    inc rdi ; increment
    jmp rindex_loop;