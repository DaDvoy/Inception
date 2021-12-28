FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install php7.3 php-mysqli php-fpm mariadb-client
COPY ./www.conf /etc/php/7.3/fpm/pool.d
RUN chmod 744 /etc/php/7.3/fpm/pool.d/www.conf

ADD https://ru.wordpress.org/wordpress-5.7.2-ru_RU.tar.gz /var/www/
RUN cd /var/www && tar -xzvf wordpress-5.7.2-ru_RU.tar.gz
RUN rm -f /var/www/wordpress-5.7.2-ru_RU.tar.gz
RUN rm -f /var/www/wordpress/wp-config-sample.php

COPY ./wp-config.php ./var/www/wordpress/
RUN chmod 744 ./var/www/wordpress/wp-config.php

RUN mkdir -p ./run/php/
# RUN mkdir -p /var/run/

CMD /usr/sbin/php-fpm7.3 -F -R