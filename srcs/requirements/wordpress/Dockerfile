FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

RUN apt-get -y update --no-install-recommends

RUN apt-get install \
	php-fpm \
	php-mysql \
	mariadb-client \
	ca-certificates \
	sendmail \
	dialog \
    -y --no-install-recommends

RUN mkdir -p /var/run/php \
	&& mkdir -p /var/run/mysqld \
	&& mkdir -p apphtml

COPY tools/wp_install.sh ./
COPY tools/wp-cli-nightly.phar ./
COPY conf/wordpress.conf ./
COPY conf/bizboost.1.0.1.zip ./apphtml/

RUN chmod +x wp_install.sh

ENV DEBIAN_FRONTEND=dialog