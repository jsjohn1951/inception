FROM debian:buster

RUN apt-get -y update --no-install-recommends

RUN apt-get install -y \
	--no-install-recommends \
	wget \
	zsh \
	git \
	nginx \
	net-tools

RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# * Nginx config location : /etc/nginx

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