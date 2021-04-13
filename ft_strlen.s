# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: masboula <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/25 14:51:58 by masboula          #+#    #+#              #
#    Updated: 2021/03/25 14:51:59 by masboula         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

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
