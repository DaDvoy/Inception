FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install nginx
RUN apt-get -y install openssl

COPY ./nginx.conf ./etc/nginx/http.d

# RUN mkdir 

RUN openssl req -x509 -nodes -days 365 -newkey \
	rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt -subj \
	"/C=RU/L=KAZAN/O=School21/CN=lmushroo.42.fr"

CMD ["nginx", "-g", "daemon off;"] 

# чтобы nginx оставался на переднем плане,
# и Docker мог правильно отслеживать процесс

# If we add a custom CMD in the Dockerfile, 
# we had to include -g daemon off; in the CMD in order
# for nginx to stay in the foreground, so that Docker
# can track the process properly (otherwise the
# container will stop immediately after starting)!