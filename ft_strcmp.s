bits 64

section .text
    global ft_strcmp

ft_strcmp :
    push rcx
    mov rcx, 0

_while :
    cmp byte [rdi + rcx], 0
    je _return
    cmp byte [rsi + rcx], 0
    je _return
    mov dl, byte [rdi + rcx]
    cmp byte [rsi + rcx], dl
    je _return
    inc rcx
    jmp _while;

_return :
    mov byte r8b, byte [rsi + rcx]
    sub byte [rdi + rcx], byte r8b
    mov rax, [rdi + rcx]
    pop rcx
    ret