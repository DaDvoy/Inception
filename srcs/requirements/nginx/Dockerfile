FROM debian:buster

RUN apt-get update && apt-get -y update
RUN apt-get -y install nginx
RUN apt-get -y install openssl
RUN openssl req -x509 -nodes -days 365 -newkey \
	rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key \
	-out /etc/ssl/nginx-selfsigned.crt -subj \
	"/C=RU/L=KAZAN/O=School21/CN=lmushroo.42.fr"

COPY nginx.conf ./etc/nginx

CMD ["nginx", "-g", "daemon off;"] 

# чтобы nginx оставался на переднем плане,
# и Docker мог правильно отслеживать процесс

# If we add a custom CMD in the Dockerfile, 
# we had to include -g daemon off; in the CMD in order
# for nginx to stay in the foreground, so that Docker
# can track the process properly (otherwise the
# container will stop immediately after starting)!