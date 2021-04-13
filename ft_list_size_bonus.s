# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_size_bonus.s                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: masboula <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/25 14:51:03 by masboula          #+#    #+#              #
#    Updated: 2021/03/25 14:58:43 by masboula         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

bits 64

section .text
    global ft_list_size

ft_list_size :
    push rcx
    mov rcx, 0

_while :
    cmp rdi, 0
    je _return
    mov rdi, [rdi + 8]
    inc rcx
    jmp _while

_return :
    mov rax, rcx
    pop rcx
    ret
