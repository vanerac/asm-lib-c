BITS 64

SECTION .text

GLOBAL memset

memset:
    mov r8, rdi ; cpy ptr
    mov r10, rdx ; cpy size
    mov rdi, 1 ; reset rdi to 0 to use as incr
    jmp memset_loop

memset_loop:
    mov [r8], sil ; cpy byte
    cmp r10, rdi; compare to size
    jne memset_inc
    ret

memset_inc:
    inc rdi ; increment
    inc r8 ; mv pointer
    jmp memset_loop;