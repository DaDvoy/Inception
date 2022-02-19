# links:

https://www.hostinger.ru/rukovodstva/kak-ustanovit-wp-cli - Как Установить и Использовать WP-CLI Для Управления WordPress;

# Basic part:

* Команды:

1. Войдите в MySQL:
` mysql -u вашеимяпользователя -p `
2. Создайте базу данных для установщика WordPress:
`create database wordpress;`
3. Настройте имя пользователя и пароль для базы данных:
`grant all on wordpress.* to 'имя пользователя' identified by 'вашпароль';`
4. Скачайте файлы установщика WordPress:
Когда база данных MySQL будет готова, вы сможете продолжить установку WordPress. Во-первых, вам необходимо скачать последнюю версию WordPress. Сделать это вы можете выполнив эту команду:
`wp core download`
5. wp core для добавления данных в базу данных  MySQL WordPress
`wp core config --dbname=wordpress --dbuser=user --dbpass=password --dbhost=localhost --dbprefix=wp_`
6.  wp core для указания данных и завершения установки:
`wp core install --url="вашдомен.ru"  --title="РУКОВОДСТВА HOSTINGER" --admin_user="имяпользователя_администратора" --admin_password="пароль_администратора" --admin_email="мойemail@email.ru"`
