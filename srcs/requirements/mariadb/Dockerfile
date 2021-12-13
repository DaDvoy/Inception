FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get install mariadb-server -y

COPY /50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY ./mybase ./etc/mysql/

# RUN mkdir /var/run/mysqld
# RUN mkfifo /var/run/mysqld/mysqld.sock
# RUN chown -R mysql /var/run/mysqld

COPY ./start.sh ./

RUN chmod +x start.sh

# VOLUME ["./var/lib/mysql"]

# EXPOSE 3306

# RUN service mysql start && mysql < mybase
# RUN rm -f mybase

# # ENTRYPOINT [ "start.sh" ]

CMD bash ./start.sh
# CMD ["/usr/sbin/mysqld",  "--user=mysql"]
# # CMD /usr/bin/mysqld_safe



# FROM debian:buster

# # updating packages
# RUN apt-get update

# # software installation
# RUN apt-get install -y mariadb-server

# # copying mysql client commands
# COPY /db.sql /etc/mysql/
# COPY /start.sh /
# COPY /50-server.cnf /etc/mysql/mariadb.conf.d/

# # CMD bash start.sh