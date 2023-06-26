FROM debian:bullseye

USER root

ENV DEBIAN_FRONTEND=noninteractive
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

RUN apt-get -y update --no-install-recommends

COPY tools/DBSetup.sh ./

RUN apt-get install \
	mariadb-server \
	mariadb-client \
	dialog \
	-y --no-install-recommends

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

RUN chmod +x DBSetup.sh

RUN chown -R root:root /var/lib/mysql

ENV DEBIAN_FRONTEND=dialog
