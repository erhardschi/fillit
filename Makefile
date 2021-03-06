# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gaerhard <gaerhard@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/29 15:24:01 by gaerhard          #+#    #+#              #
#    Updated: 2018/12/03 14:40:52 by gaerhard         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fillit

SRC = parser.c shift.c main.c solver.c print_map.c piece_process.c

OBJ = $(SRC:.c=.o)

INCLUDES = includes

CFLAGS = -Wall -Wextra -Werror -I $(INCLUDES)
RED := "\033[0;31m"
GREEN := "\033[0;32m"
CYAN := "\033[0;36m"
RESET :="\033[0m"
BLINK := "\033[5m"

all: $(NAME)

$(NAME): $(OBJ)
	@make -C includes
	@gcc $(CFLAGS) $(OBJ) includes/libft.a -o $(NAME)
	@echo ${GREEN}"[INFO] Compiled [$(NAME)] executable successfully!"

clean: 
	@clear
	@rm -Rf $(OBJ)
	@make clean -C includes
	@echo ${CYAN}"[INFO] Removed [$(OBJ)] successfully!"

fclean: clean
	@clear
	@make fclean -C includes
	@rm -Rf fillit
	@echo ${CYAN}"[INFO] Removed everything because SKIBIDI PA PA"

re: fclean all

.SILENT: $(OBJ)
.PHONY: fclean all clean
