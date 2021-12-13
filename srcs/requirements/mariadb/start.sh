#!/bin/bash

openrc default
/etc/init.d/mariadb setup

rc-service mariadb start
echo "mariadb start"
mysql -e "CREATE DATABASE IF NOT EXISTS data;" -u root
mysql -e "CREATE USER IF NOT EXISTS 'lmushroo'@'%' IDENTIFIED BY 'something';" -u root
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'lmushroo'@'%';" -u root
mysql -e "FLUSH PRIVILEGES;" -u root
#mysqladmin -u root password qwerty1234
rc-service mariadb stop
echo "mariadb stop"
mysqld --user=root