#! /bin/bash

service mariadb start

/usr/bin/mariadb -e "CREATE DATABASE IF NOT EXISTS $M_DB;"
/usr/bin/mariadb -e "CREATE USER IF NOT EXISTS '${M_USER}'@'%' IDENTIFIED BY '${M_USER_PW}';"
/usr/bin/mariadb -e "GRANT ALL PRIVILEGES ON ${M_DB}.* TO '${M_USER}'@'%';"
/usr/bin/mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIA_ROOT_PASSWORD}';"
/usr/bin/mariadb -e "CREATE USER IF NOT EXISTS 'root'@'%' IDENTIFIED BY '${MARIA_ROOT_PASSWORD}';"
/usr/bin/mariadb -e "GRANT ALL PRIVILEGES on *.* TO 'root'@'%' WITH GRANT OPTION;"
/usr/bin/mariadb -e "FLUSH PRIVILEGES;"

service mariadb stop

mysqld_safe --defaults-extra-file=/etc/mysql/mariadb.conf.d/50-server.cnf


# mariadb commands :
# 	mariadb
# 	show databases;
# 	use database 
# 	show tables
