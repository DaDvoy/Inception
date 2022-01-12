FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get install mariadb-server sudo -y

COPY ./50-server.cnf ./etc/mysql/mariadb.conf.d/
RUN chmod 744 ./etc/mysql/mariadb.conf.d/50-server.cnf

COPY db.sql ./

RUN service mysql start && mysql < db.sql

EXPOSE 3306

CMD /usr/bin/mysqld_safe