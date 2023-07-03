# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wismith <wismith@42ABUDHABI.AE>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/30 16:23:56 by wismith           #+#    #+#              #
#    Updated: 2023/07/02 04:14:31 by wismith          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = Inception

SRCS = ./srcs/docker-compose.yml

COMP = docker-compose

DIRFLAG =  -f $(SRCS)

all : $(NAME)

$(NAME) : up

up :
	mkdir -p /home/wismith/data/wordpress
	mkdir -p /home/wismith/data/db
	$(COMP) $(DIRFLAG) up -d --build

down :
	$(COMP) $(DIRFLAG) down --rmi all

prune :
	@tput setaf 1
	docker builder prune -f
	@tput init

fclean : down rmv prune

rmi :
	docker rmi all

rmv :
	docker volume rm -f srcs_wordPress
	docker volume rm -f srcs_DB
	rm -rf /home/wismith/data/wordpress
	rm -rf /home/wismith/data/db

re : fclean up

.PHONY : all up down prune fclean rmi rmv re

	
