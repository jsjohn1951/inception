# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wismith <wismith@42ABUDHABI.AE>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/30 16:23:56 by wismith           #+#    #+#              #
#    Updated: 2023/06/08 13:35:37 by wismith          ###   ########.fr        #
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
	$(COMP) $(DIRFLAG) down --rmi all -v

rmi:
	-docker rmi all

re : down up

.PHONY : all up down re

	
