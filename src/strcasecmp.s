BITS 64

SECTION .text

GLOBAL strcasecmp


strcasecmp_convert:
    cmp edi, 97
    jnle strcasecmp_loop
    sub edi, 32
    mov al, dl
    jmp strcasecmp_loop


strcasecmp:
    mov rax, 0
    jmp strcasecmp_loop


strcasecmp_loop:
    // test case str1
    mov cl, BYTE [rsi]
    movsx edi, cl
    call strcasecmp_convert
    mov cl, al
    // test case str2
    mov sil, BYTE [rdi]
    movsx edi, sil
    call strcasecmp_convert
    mov sil, al

    // did it save previous ??
    cmp cl, sil
    jne strcasecmp_end
    inc rsi
    inc rdi
    jmp strcasecmp_loop

strcasecmp_end:
    mov rax, [rdi]
    sub rax, [rsi]
    ret
