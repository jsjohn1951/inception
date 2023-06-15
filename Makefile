# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wismith <wismith@42ABUDHABI.AE>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/30 16:23:56 by wismith           #+#    #+#              #
#    Updated: 2023/06/15 17:46:00 by wismith          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception

SRCS = ./srcs/docker-compose.yml

COMP = docker-compose

DIRFLAG =  -f $(SRCS)

all : $(NAME)

$(NAME) : up

clean :
	@tput setaf 1
	docker builder prune -f
	@tput init

fclean : down rmv clean

up :
	$(COMP) $(DIRFLAG) up -d --build

down :
	$(COMP) $(DIRFLAG) down --rmi all

rmi :
	docker rmi all

rmv :
	docker volume rm srcs_wordpress

re : down up

.PHONY : all up down re

	
