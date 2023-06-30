#! /bin/bash

envsubst '${WP_DOMAIN}' < ./nginx.conf > ./etc/nginx/sites-available/nginx.conf

chown www-data:www-data ./etc/nginx/sites-available/nginx.conf

ln -s /etc/nginx/sites-available/*.conf	etc/nginx/sites-enabled/

openssl req -x509 \
	-sha256 -days 356 \
	-nodes \
	-newkey rsa:2048 \
	-subj "/CN=demo.mlopshub.com/C=US/L=San Fransisco" \
	-keyout /etc/ssl/$WP_DOMAIN.key -out /etc/ssl/$WP_DOMAIN.crt


nginx -g 'daemon off;'