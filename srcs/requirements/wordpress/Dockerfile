FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install php-mysql php-fpm php-mbstring php-gd php-xml wget
	
# COPY ./www.conf ./etc/php/7.3/fpm/pool.d/
COPY ./www.conf .
RUN mv www.conf /etc/php/7.3/fpm/pool.d/www.conf
# RUN chmod 744 ./etc/php/7.3/fpm/pool.d/www.conf

COPY ./wp-config.php .
COPY ./wp.sh  .

RUN chmod +x wp.sh

ENTRYPOINT [ "bash", "wp.sh" ]
# RUN mkdir -p /var/run/

EXPOSE 9000

CMD /usr/sbin/php-fpm7.3 -F -R