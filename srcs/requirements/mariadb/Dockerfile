FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get install mariadb-server sudo -y

COPY ./50-server.cnf ./etc/mysql/mariadb.conf.d/
COPY ./my.cnf ./etc/mysql/

COPY start.sh ./
COPY db.sql ./
RUN chmod +x start.sh

# CMD ["./start.sh"]

RUN service mysql start && mysql < db.sql

CMD /usr/bin/mysqld_safe