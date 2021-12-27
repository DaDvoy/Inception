FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install nginx
RUN apt-get -y install openssl

COPY ./nginx.conf ./etc/nginx/http.d

RUN openssl req -x509 -nodes -days 365 -newkey \
	rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt -subj \
	"/C=RU/L=KAZAN/O=School21/CN=lmushroo.42.fr"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"] 