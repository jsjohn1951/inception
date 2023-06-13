FROM debian:buster

# ! noninteractive - zero interaction while installing or upgrading with apt
ENV DEBIAN_FRONTEND=noninteractive

ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

#! installing updates
RUN apt-get -y update --no-install-recommends

#! installing nginx, procps, and systemctl
RUN	apt-get install nginx openssl -y --no-install-recommends

COPY --chown=www-data:www-data ./conf/index.html ./var/www/html/
COPY --chown=www-data:www-data ./conf/nginx.conf ./etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/*.conf	etc/nginx/sites-enabled/ \
		&& openssl req -x509 \
            -sha256 -days 356 \
            -nodes \
            -newkey rsa:2048 \
            -subj "/CN=demo.mlopshub.com/C=US/L=San Fransisco" \
            -keyout /etc/ssl/wil.42.fr.key -out /etc/ssl/wil.42.fr.crt

# ! dialog - The default frontend for apt/apt-get under Debian/Ubuntu Linux.
ENV DEBIAN_FRONTEND=dialog

# * Check port : 				curl -vvv localhost:443
# * Nginx config location : 	/etc/nginx
# * Check nginx is running :	service nginx status

#! build an image :
#	docker build . -t nginx

#! run in interactive mode
# 	docker run -it nginx "/bin/bash"

#! exec in another term window :
# 	docker exec -it "$name" "/bin/bash"

#! Docker remove container & image
# 		docker rm "$name"
#		docker rmi nginx