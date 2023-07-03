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
	docker volume rm srcs_wordPress
	docker volume rm srcs_DB

re : fclean up

.PHONY : all up down prune fclean rmi rmv re

	
