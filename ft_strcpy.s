# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: masboula <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/25 14:51:25 by masboula          #+#    #+#              #
#    Updated: 2021/03/25 14:51:28 by masboula         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

bits 64

section .text
    global ft_strcpy

ft_strcpy :
    push rcx
    mov rcx, 0

_while :
    mov dl, byte [rsi + rcx]
    mov byte [rdi + rcx], dl
    cmp byte [rsi + rcx], 0
    je _return
    inc rcx
    jmp _while;

_return :
    mov rax, rdi
    pop rcx
    ret
