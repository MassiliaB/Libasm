bits 64

section .text
    global ft_strlen

ft_strlen :
    push rcx
    mov rcx, 0

_while :
    cmp byte [rdi + rcx], 0
    je _return
    inc rcx
    jmp _while

_return :
    mov rax, rcx
    pop rcx
    ret