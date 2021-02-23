memcpy:
    mov r8, rdi ; cpy ptr dest
    mov r9, rsi ; cpy ptr src
    mov r10, rdx ; cpy size
    mov rdi, 1 ; reset rdi to 0 to use as incr
    jmp memcpy_loop

memcpy_loop:
    mov cl, BYTE [r9]
    mov [r8], cl ; cpy byte
    cmp r10, rdi; compare to size
    jne memcpy_inc
    ret

memcpy_inc:
    inc rdi ; increment
    inc r8 ; mv dest
    inc r9 ; mv src
    jmp memcpy_loop;