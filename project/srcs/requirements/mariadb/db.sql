CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'lmushroo'@'%' IDENTIFIED BY 'something';
GRANT ALL PRIVILEGES ON wordpress.* TO 'lmushroo'@'%';
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'nothing';
GRANT SELECT, INSERT ON wordpress.* TO 'user'@'%';
UPDATE mysql.user SET plugin='password' WHERE User = 'root' AND Host = 'localhost';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD';
FLUSH PRIVILEGES;