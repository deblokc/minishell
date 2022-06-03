# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tnaton <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/23 11:46:46 by tnaton            #+#    #+#              #
#    Updated: 2022/05/14 10:20:27 by ghanquer         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

vpath %.c src libft
vpath %.h src libft
vpath %.o src

NAME = minishell

LIBFT = libft/libft.a

#HOW TO LIST .c 
#	ls -l | awk '{print $9}' | grep -E ".c$"| sed "s/\.c/ \\\/g" | sed '$s/\\$//g'
#
SRC = principale.c analysesyntaxique.c liberation.c fais_dedans.c exec.c \
	  heredoc.c lance_exec.c Pipex/child_bonus.c ft_splitsane_tools.c\
	  Pipex/free_fun_bonus.c Pipex/recur.c ft_splitsane.c gnl/get_next_line.c \
	  gnl/get_next_line_utils.c cartes_savages.c lst_name_utils.c \
	  env_list_utils.c exec_utils.c cartes_utils.c cartes_tools.c ft_echo.c \
	  fais_dedans_utils.c fais_dedans_tools.c fais_dedans_last.c heredoc2.c\
	  heredoc3.c heredoc4.c analysesyntaxique2.c analysesyntaxique3.c \
	  analysesyntaxique4.c lance_exec2.c lance_exec3.c lance_exec4.c \
	  lance_exec5.c principale2.c principale3.c principale4.c indexeage.c\
	  cak.c cartes_savages_norme.c indexeage2.c indexeage3.c indexeage4.c

source = $(addprefix src/,$(SRC))

CFLAGS = -Wall -Werror -Wextra -Iinc/MinusculeCoquille.h

CC =	clang

object = $(source:.c=.o)

$(NAME) : $(object) $(LIBFT) 
	$(CC) $(CFLAGS) $(object) $(LIBFT) -o $@ -lreadline

-include libft/Makefile

$(LIBFT) : $(BONUS) $(SRCS) libft/libft.h
	$(MAKE) bonus -C ./libft

$(object) : inc/MinusculeCoquille.h libft/libft.h

debug : $(object)
	$(CC) $(CFLAGS) -g3 -fsanitize=address $(object) $(LIBFT) -o $@ -lreadline

malloc_test: $(object) $(LIBFT)
	$(CC) $(CFLAGS) -fsanitize=undefined -rdynamic -o $@ $(object) $(LIBFT) -lreadline -L. -lmallocator

.PHONY: all
all : $(NAME)

.PHONY: clean
clean :
		rm -rf $(object)
		$(MAKE) clean -C ./libft

.PHONY: fclean
fclean :
		rm -rf $(NAME) $(object)
		$(MAKE) fclean -C ./libft

.PHONY: re
re : fclean all

.PHONY: coffee

define print_aligned_coffee
	@t=$(NAME); \
	l=$${#t};\
	i=$$((8 - l / 2));\
	echo "             \0033[1;32m\033[3C\033[$${i}CAnd Your program \"$(NAME)\" "
endef

coffee: all clean
	@echo ""
	@echo "                                {"
	@echo "                             {   }"
	@echo "                              }\0033[1;34m_\0033[1;37m{ \0033[1;34m__\0033[1;37m{"
	@echo "                           \0033[1;34m.-\0033[1;37m{   }   }\0033[1;34m-."
	@echo "                          \0033[1;34m(   \0033[1;37m}     {   \0033[1;34m)"
	@echo "                          \0033[1;34m| -.._____..- |"
	@echo "                          |             ;--."
	@echo "                          |            (__  \ "
	@echo "                          |             | )  )"
	@echo "                          |   \0033[1;96mCOFFEE \0033[1;34m   |/  / "
	@echo "                          |             /  / "
	@echo "                          |            (  / "
	@echo "                          \             | "
	@echo "                            -.._____..- "
	@echo ""
	@echo ""
	@echo "\0033[1;32m\033[3C                    Take Your Coffee"
	$(call print_aligned_coffee)


.SECONDARY: $(object)
