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

#COLORS#
_END	= \033[0m
_GREEN	= \033[0;32m
_RED	= \033[0;31m
_BLUE	= \033[0;96m
_YELLOW = \033[0;33m
_MAG = \033[0;35m

NAME = libasm.a

SRCS = 	ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s \

SRCS_BONUS =  ft_list_size_bonus.s 

OBJS = $(SRCS:.s=.o)

OBJS_BONUS = $(SRCS_BONUS:.s=.o)

CC = clang

NASM = nasm -f elf64

CFLAGS = -Wall -Wextra -Werror

RM = rm -f

LIB = ar -rc ${NAME}

%.o: %.s
	@${NASM} $<
	@echo "$(_YELLOW) Compiling asm files. $(_END)"

all: ${NAME}

$(NAME): ${OBJS}
	@echo "$(_GREEN) All files are compiled ! $(_END)"
	@${LIB} ${OBJS}
	@echo "$(_GREEN) Library ${NAME} was created. $(_END)"
	@echo "$(_BLUE) ██╗     ██╗██████╗  █████╗ ███████╗███╗   ███╗ $(_END)"
	@echo "$(_BLUE) ██║     ██║██╔══██╗██╔══██╗██╔════╝████╗ ████║ $(_END)"
	@echo "$(_BLUE) ██║     ██║██████╔╝███████║███████╗██╔████╔██║ $(_END)"
	@echo "$(_BLUE) ██║     ██║██╔══██╗██╔══██║╚════██║██║╚██╔╝██║ $(_END)"
	@echo "$(_BLUE) ███████╗██║██████╔╝██║  ██║███████║██║ ╚═╝ ██║ $(_END)"
	@echo "$(_BLUE) ╚══════╝╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝ $(_END)"
	@echo "$(_BLUE)                          Run make tester now ! $(_END)"

tester:	${NAME}
	@${CC} ${CFLAGS} ${OBJS} main.c

bonus: ${OBJS} ${OBJS_BONUS}
	@echo "$(_GREEN)Bonus compiled !$(_END)"
	@${LIB} ${OBJS} ${OBJS_BONUS}

tester_bonus: bonus
	@${CC} ${CFLAGS} ${OBJS_BONUS} main_bonus.c

clean:
	@${RM} ${OBJS} ${OBJS_BONUS} a.out
	@echo "$(_RED) Cleaning objs. $(_END)"

fclean: clean
	@${RM} ${NAME}
	@echo "$(_RED) Everything was cleaned. $(_END)"
	@echo "$(_MAG) ██████╗ ██   ██╗███████╗ $(_END)"
	@echo "$(_MAG) ██╔══██╗██   ██║██╔════╝ $(_END)"
	@echo "$(_MAG) ██████╔╝███████║███████║ $(_END)"
	@echo "$(_MAG) ██╔══██╗ ╔═══██║██═════╗ $(_END)"
	@echo "$(_MAG) ██████╔╝ ██████║███████║ $(_END)"
	@echo "$(_MAG) ╚═════╝  ╚═════╝╚══════╝ $(_END)"


re: fclean all

.PHONY: all clean fclean re