FROM debian:bullseye-slim

# ! noninteractive - zero interaction while installing or upgrading with apt
ENV DEBIAN_FRONTEND=noninteractive

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

#! installing updates
RUN apt-get -y update --no-install-recommends

#! installing nginx, procps, and systemctl
RUN	apt-get install \
	nginx \
	dialog \
	openssl \
	gettext-base \
	-y --no-install-recommends

# COPY --chown=www-data:www-data ./conf/nginx.conf ./etc/nginx/sites-available/
COPY ./conf/nginx.conf ./
COPY tools/nginx_config.sh ./

RUN chmod +x ./nginx_config.sh

# ! dialog - The default frontend for apt/apt-get under Debian/Ubuntu Linux.
ENV DEBIAN_FRONTEND=dialog
