bits 64

extern ft_strlen
extern ft_strcpy
extern malloc

section .text
    global ft_strdup

ft_strdup :
    _malloc :
        push rdi
        call ft_strlen wrt ..plt     ; from rdi
        inc rax
        mov rdi, rax                ; put the return value in rdi
        call malloc wrt ..plt        ; give the number of bytes to allocate, now rax point to the allocated memory
    _copy :
        pop rdi
        mov rsi, rdi
        mov rdi, rax
        call ft_strcpy wrt ..plt

_return :
    ret