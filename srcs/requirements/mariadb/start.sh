#!/bin/bash

# mysql_install_db --user=mysql --datadir=/var/lib/mysql

# cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'



# editing ports in config
sed -ie 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
sed -ie 's/#port/port/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# starting mysql and creating database if it doesn't exist
if [ ! -d /var/lib/mysql/DB ]
then
service mysql start
apt-get install -y gettext-base
envsubst < /etc//mysql/create_mysql_db.sql | mysql
mysqladmin -u root password $DB_ROOT_PASSWORD
service mysql stop
fi
chown -R mysql:mysql /var/lib/mysql

# running mysql in background
mysqld_safe