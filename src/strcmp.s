BITS 64

SECTION .text

GLOBAL strcmp

strcmp:
    jmp strcmp_loop

strcmp_loop:
    mov cl, BYTE [rsi] ; cpy bytecc
    cmp [rdi], cl
    jne strcmp_end ; ret null if null

    mov cl, BYTE [rdi] ; cpy byte

    cmp cl, 0 ; compare to searched
    je strcmp_end

    inc rdi ; increment
    inc rsi
    jmp strcmp_loop
    ret

strcmp_end:
    mov rax, [rdi]
    sub rax, [rsi]
    ret

strcmp_inc:
    inc rdi ; increment
    inc rsi
