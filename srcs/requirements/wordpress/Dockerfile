FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

#! installing updates
RUN apt-get -y update --no-install-recommends

RUN apt-get install \
    php7.3-fpm \
	curl \
	wget \
	unzip \
	php-mysqli \
	mariadb-client \
	ca-certificates \
	\
	systemd \
	\
    -y --no-install-recommends

RUN mkdir -p /var/run/php \
	&& mkdir -p /var/run/mysqld

COPY tools/wp_install.sh ./
COPY conf/wordpress.conf /etc/php/7.3/fpm/pool.d

RUN chmod +x wp_install.sh && ./wp_install.sh

ENV DEBIAN_FRONTEND=dialog
