# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: masboula <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/25 14:51:34 by masboula          #+#    #+#              #
#    Updated: 2021/03/25 14:53:03 by masboula         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

bits 64

extern ft_strlen
extern ft_strcpy
extern malloc

section .text
    global ft_strdup

ft_strdup :
    _malloc :
        push rdi
        call ft_strlen wrt ..plt
        inc rax
        mov rdi, rax
        call malloc wrt ..plt
    _copy :
        pop rdi
        mov rsi, rdi
        mov rdi, rax
        call ft_strcpy wrt ..plt

_return :
    ret
