BITS 64

SECTION .text

GLOBAL memcpy

memcpy:
    jmp memcpy_loop

memcpy_loop:
    cmp rdx, 0; compare to size
    je memcpy_end
    mov cl, BYTE [rsi]
    mov [rdi], cl ; cpy byte
    dec rdx
    inc rdi ; mv dest
    inc rsi ; mv src
    jmp memcpy_loop;

memcpy_end:
    ret
