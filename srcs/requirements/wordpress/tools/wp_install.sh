#! /bin/bash

#* setup wordpress command line interface
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

#* make directories
mkdir -p /var/www/html/wil.42.fr
chown -R www-data:www-data /var/www/html/wil.42.fr
chown www-data:www-data /var/www/html/wil.42.fr

#* download workpress
cd /var/www/html/wil.42.fr
wp core download --allow-root