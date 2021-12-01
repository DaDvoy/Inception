FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get install mariadb-server -y sudo

COPY ./mybase ./

COPY /50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir /var/run/mysqld
RUN mkfifo /var/run/mysqld/mysqld.sock
RUN chown -R mysql /var/run/mysqld

EXPOSE 3306

RUN ./mybase
RUN service mysql start && mysql < mybase

COPY ./start.sh ./

RUN chmod +x start.sh

VOLUME ./var/lib/mysql

# ENTRYPOINT [ "start.sh" ]

# CMD sh start.sh