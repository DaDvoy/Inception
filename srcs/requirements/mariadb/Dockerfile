FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get install mariadb-server -y

COPY /50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./mybase ./

RUN mkdir -p /home/lmushroo/data/mariadb

RUN mkdir /var/run/mysqld
RUN mkfifo /var/run/mysqld/mysqld.sock
RUN chown -R mysql /var/run/mysqld

COPY ./start.sh ./

RUN chmod +x start.sh

VOLUME ["./var/lib/mysql"]

EXPOSE 3306

RUN service mysql start && mysql < mybase
# ENTRYPOINT [ "start.sh" ]

# CMD ["./start.sh"]
# CMD /usr/bin/mysqld_safe