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
  wp core install --allow-root \
      --url=localhost/wordpress/ \ #поменять ключи на $(something)
      --title=MY_TITLE \
      --admin_user=lmushroo \
      --admin_password=lmushroo \
      --admin_email=lmushroo@student.com
  wp user create --allow-root ${USER} ${EMAIL} --user_pass=${PASS}
fi
exec "$@"