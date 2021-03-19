bits 64

section .text
    global ft_strcpy

ft_strcpy :
    push rcx
    mov rcx, 0

_while :
    cmp byte [rsi + rcx], 0
    mov dl, byte [rsi + rcx]
    mov byte [rdi + rcx], dl
    je _return
    inc rcx
    jmp _while;

_return :
    mov rax, rdi
    pop rcx
    ret