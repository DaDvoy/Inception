FROM debian:buster

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install wget tar unzip php7.3 php-mysqli php-fpm mariadb-client
# RUN apt-get -y install php-fpm php-mbstring php-gettext php-mysql \
# php-curl php-gd php-intl php-soap php-xml php-xmlrpc php-zip

# RUN curl -LO https://wordpress.org/latest.tar.gz
# RUN tar -xzvf latest.tar.gz
# RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip
# RUN unzip phpMyAdmin-5.0.4-all-languages.zip

# # RUN chmod -R 755 /var/www/*
# # RUN mkdir /var/www/html/wordpress

# RUN mv phpMyAdmin-5.0.4-all-languages ./phpMyAdmin
# # RUN mv wordpress ./var/www/html/wordpress


# COPY ./wp-config.php /var/www/html/wordpress/wp-config.php
# COPY ./www.conf /var/www/html/wordpress/

RUN mkdir -p /home/lmushroo/data/wordpress

COPY ./www.conf /etc/php/7.3/fpm/pool.d

ADD https://ru.wordpress.org/wordpress-5.7.2-ru_RU.tar.gz /var/www/
RUN cd /var/www && tar -xzvf wordpress-5.7.2-ru_RU.tar.gz
RUN rm -f /var/www/wordpress-5.7.2-ru_RU.tar.gz
RUN rm -f /var/www/wordpress/wp-config-sample.php
COPY ./wp-config.php ./var/www/wordpress/

RUN mkdir ./run/php/
CMD ./usr/sbin/php-fpm7.3 -F


EXPOSE 9000