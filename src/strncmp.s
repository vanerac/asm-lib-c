BITS 64

SECTION .text

GLOBAL strncmp

strncmp:
    mov r8, rdi ; cpy ptr dest
    mov rdi, 1 ; reset rdi to 0 to use as incr
    jmp strncmp_loop

strncmp_loop:
    mov cl, BYTE [rsi] ; cpy bytecc
    cmp [r8], cl
    jne strncmp_end ; ret null if null

    mov cl, BYTE [r8] ; cpy byte

    cmp cl, 0 ; compare to searched
    je strncmp_end

    cmp rdi, rdx
    je strncmp_end

    inc rdi ; increment
    inc rsi
    inc r8
    jmp strncmp_loop
    ret

strncmp_end:
    mov rax,  [r8]
    sub rax,  [rsi]
    ret
