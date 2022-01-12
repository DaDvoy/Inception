    sleep 10
  mkdir -p /run/php/
  touch /run/php/php7.3-fpm.pid
  chown -R www-data:www-data /var/www/*
  chmod -R 755 /var/www/*

if [ ! -f /var/www/html/wp-config.php ]; then
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  cd /var/www/html/
  wp core download --allow-root
  mv ./wp-config.php /var/www/html/ #можно перенести в докерфайл
  echo "Configuring Wordpress parameters"
  wp config create --allow-root \
      --dbname=${DB_NAME} \
      --dbuser=${DB_USER_ADMIN} \
      --dbpass=${DB_PASSWORD_ADMIN} \
      --dbhost=${DB_HOST} 
      --dbprefix=wp_
  wp core install --allow-root \
      --url=localhost/wordpress/ \ #поменять ключи на $(something)
      --title=${WP_TITLE} \
      --admin_user=${WP_ADMIN} \
      --admin_password=${WP_ADMIN_PASS} \
      --admin_email=${WP_ADMIN_EMAIL}
  wp user create --allow-root ${USER} ${EMAIL} --user_pass=${PASS}
fi
exec "$@"