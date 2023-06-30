FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

RUN apt-get -y update --no-install-recommends

RUN apt-get install \
	lsb-release \
	wget \
	ca-certificates \
	gnupg2 \
	-y --no-install-recommends

RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main"\
		| tee /etc/apt/sources.list.d/sury-php.list && \
		wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -

RUN apt-get update -y --no-install-recommends

RUN apt-get install \
    php7.3-fpm \
	php7.3-mysql \
	mariadb-client \
	dialog \
    -y --no-install-recommends

RUN mkdir -p /var/run/php \
	&& mkdir -p /var/run/mysqld \
	&& mkdir -p apphtml

COPY tools/wp_install.sh ./
COPY tools/wp-cli-nightly.phar ./
COPY conf/bizboost.1.0.1.zip ./apphtml/
COPY conf/wordpress.conf /etc/php/7.3/fpm/pool.d/

RUN chmod +x wp_install.sh

ENV DEBIAN_FRONTEND=dialog
