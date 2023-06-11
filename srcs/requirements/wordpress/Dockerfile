FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive

#! installing updates
RUN apt-get -y update --no-install-recommends

#! install php and wordpress
RUN apt-get install \
    php-fpm \
    php-mbstring \
    php-mysql \
    php-gd \
    wordpress \
    -y --no-install-recommends

