#! /bin/bash

# * setup wordpress command line interface
chmod +x wp-cli-nightly.phar
mv wp-cli-nightly.phar /usr/local/bin/wp

# * make directories
mkdir -p /apphtml
chown -R www-data:www-data /apphtml
chown www-data:www-data /apphtml

# * download workpress
wp core download \
	--version=6.2.2 \
	--path=/apphtml \
	--allow-root

cd /apphtml

# * generates wp-config.php

wp core config \
	--dbname=$M_DB \
	--dbuser=$M_USER \
	--dbpass=$M_USER_PW \
	--dbhost=$M_HOST \
	--dbprefix='wp_' \
	--allow-root

if ! wp core is-installed --allow-root; then

	wp core install \
		--url=https://$WP_DOMAIN \
		--title="$WP_TITLE" \
		--admin_user=$WP_ADMIN_NAME \
		--admin_password=$WP_ADMIN_PW \
		--admin_email=$WP_ADMIN_EMAIL \
		--allow-root

	if wp core is-installed --allow-root; then
		wp user create \
			$WP_USER \
			$WP_USER_EMAIL \
			--user_pass=$WP_USER_PW \
			--role='editor' \
			--allow-root
	
		wp theme install \
			bizboost.1.0.1.zip \
			--allow-root
	
		wp theme activate \
			bizboost \
			--allow-root
	fi
fi


cd ..

./usr/sbin/php-fpm7.3 -F -R