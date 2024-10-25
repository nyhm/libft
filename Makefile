# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hnagashi <hnagashi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/23 22:57:56 by hnagashi          #+#    #+#              #
#    Updated: 2024/10/25 12:36:08 by hnagashi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# 変数の定義
NAME = libft.a

# ソースファイル
IS_SRCS = ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c 
MEM_SRCS = ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c ft_memset.c ft_bzero.c ft_calloc.c
STR_SRCS = ft_strlen.c ft_strchr.c ft_strdup.c ft_strrchr.c ft_strncmp.c ft_strnstr.c ft_strlcat.c ft_strlcpy.c
TO_SRCS = ft_atoi.c ft_tolower.c ft_toupper.c
PART2_SRCS = ft_substr.c ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c
BONUS_SRCS = ft_lstadd_back.c ft_lstadd_front.c ft_lstclear.c ft_lstdelone.c ft_lstiter.c ft_lstlast.c ft_lstmap.c ft_lstnew.c ft_lstsize.c

# すべてのソースファイル
SRCS = $(IS_SRCS) $(MEM_SRCS) $(STR_SRCS) $(TO_SRCS) $(PART2_SRCS)

# オブジェクトファイル
OBJS = $(SRCS:.c=.o)
BONUS_OBJS = $(BONUS_SRCS:.c=.o)

# コンパイラとフラグ
CC = cc
CFLAGS = -Wall -Wextra -Werror
BONUS_FLAG = .bonus_done

# Makefileのルール
# デフォルトのターゲット：ライブラリの作成
all: $(NAME)

# ライブラリの作成
$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

# ボーナス用のターゲット
bonus: $(BONUS_FLAG)

$(BONUS_FLAG):$(BONUS_OBJS)
	ar rcs $(NAME) $(BONUS_OBJS)
	@touch $(BONUS_FLAG)

# .oファイルのルール
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# クリーンアップ：オブジェクトファイルを削除
clean:
	rm -f $(OBJS) $(BONUS_OBJS) $(BONUS_FLAG)

# フルクリーンアップ：オブジェクトファイルとライブラリを削除
fclean: clean
	rm -f $(NAME)

# 再コンパイル
re: fclean all

# ダミールール
.PHONY: all clean fclean re bonus