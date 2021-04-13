# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: masboula <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/25 14:52:07 by masboula          #+#    #+#              #
#    Updated: 2021/03/25 14:52:08 by masboula         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

bits 64

extern __errno_location

section .text
    global ft_write

ft_write :
    mov rax, 1
    syscall
    cmp rax, 0
    jl _error
    ret

_error :
    push rdi
    neg rax
    mov rdi, rax
    call __errno_location wrt ..plt
    mov [rax], rdi
    mov rax, -1
    pop rdi
    ret
