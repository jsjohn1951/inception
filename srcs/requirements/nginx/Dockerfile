#? Base layer
FROM debian:buster

ENV DEBIAN_FRONTEND=noninteractive

#? Layer 1
#! installing updates
RUN apt-get -y update --no-install-recommends

#? Layer 2
#! installing nginx, procps, and systemctl
RUN	apt-get install nginx -y --no-install-recommends

# COPY ./conf/server.conf ./etc/nginx/conf.d
# COPY ./conf/nginx.conf ./etc/nginx

# * Check port : 				curl -vvv localhost:443
# * Nginx config location : 	/etc/nginx
# * Check nginx is running :	service nginx status

#! build an image :
#	docker build . -t nginx

#! run in interactive mode
# 	docker run -it nginx "/bin/bash"

#! exec in another term window :
# 	name=$(docker ps --all | grep nginx | awk '{print $(NF)}')
# 	docker exec -it "$name" "/bin/bash"

#! Docker remove container & image
# 		name=$(docker ps --all | grep nginx | awk '{print $(NF)}')
# 		docker rm "$name"
#		docker rmi nginx