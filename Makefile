# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: masboula <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/16 13:07:29 by masboula          #+#    #+#              #
#    Updated: 2021/03/16 13:14:33 by masboula         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRCS = 	ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s \

OBJS = $(SRCS:.s=.o)

CC = clang

NASM = nasm -f elf64

CFLAGS = -Wall -Wextra -Werror

RM = rm -f

LIB = ar -rc ${NAME}

%.o: %.s
	${NASM} $<

all: ${NAME}

$(NAME): ${OBJS}
	${LIB} ${OBJS}

tester:	${NAME}
		${CC} ${CFLAGS} ${OBJS} main.c

clean:
	${RM} ${OBJS} a.out

fclean: clean
	${RM} ${NAME}

re: fclean all

.PHONY: all clean fclean re
