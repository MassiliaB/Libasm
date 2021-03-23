bits 64

section .text
    global ft_strcmp

ft_strcmp :
    push rcx
    mov rcx, 0

    _while :
        mov dl, byte [rdi + rcx] ; c = s1[i]
        cmp dl, 0                ; if c == '\0'
        je _return
        cmp dl, byte [rsi + rcx] ; if s1[i] != s2[i]
        jne _return
        inc rcx
        jmp _while;

_return :
    sub dl, byte [rsi + rcx]    ; c - s2[i]
    movzx rax, dl
    pop rcx
    ret