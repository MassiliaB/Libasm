# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: masboula <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/25 14:51:17 by masboula          #+#    #+#              #
#    Updated: 2021/03/25 14:51:18 by masboula         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

bits 64

section .text
    global ft_strcmp

ft_strcmp :
    push rcx

    _while :
        mov dl, byte [rdi]
        cmp dl, byte [rsi]
        je _check
        jmp _return
_check :
    cmp dl, 0
    je _return
    inc rdi
    inc rsi
    jmp _while

_return :
    sub dl, byte [rsi]
    movsx rax, dl
    pop rcx
    ret
