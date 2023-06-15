#! /bin/bash

#* setup wordpress command line interface
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

#* make directories
mkdir -p /apphtml
chown -R www-data:www-data /apphtml
chown www-data:www-data /apphtml

#* download workpress
cd /apphtml
wp core download --allow-root
# wp core config --dbname='wordpress' \
# 		--dbuser='wpuser' \
# 		--dbpass='password' \
# 		--dbhost='localhost' \
# 		--dbprefix='wp_' \
# 		--allow-root