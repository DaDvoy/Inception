FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get install mariadb-server -y

COPY ./mybase ./

EXPOSE 3306
