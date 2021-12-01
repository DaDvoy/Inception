# links:

https://coderoad.ru/55324374/%D0%A3-%D0%BC%D0%B5%D0%BD%D1%8F-%D0%B5%D1%81%D1%82%D1%8C-%D0%B4%D0%B2%D0%B0-%D0%B8%D0%B7%D0%BE%D0%B1%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D1%8F-MariaDb-%D0%B2-Docker-%D0%BD%D0%BE-%D0%BE%D0%B4%D0%BD%D0%B0-%D0%BA%D0%BE%D0%BD%D1%84%D0%B8%D0%B3%D1%83%D1%80%D0%B0%D1%86%D0%B8%D1%8F - У меня есть два изображения MariaDb в Docker, но одна конфигурация;

https://qastack.ru/programming/36387032/how-to-set-a-path-on-host-for-a-named-volume-in-docker-compose-yml - Как установить путь на хосте для именованного тома в docker-compose.yml;

https://docs.docker.com/compose/compose-file/compose-versioning/#version-2 - Compose file versions and upgrading(VOLUME);



# Basic part:

```
db:
  build:
    context: ./context
    dockerfile: /path/Dockerfile
  image: mariadb:dev
```
Это говорит Docker, что вы хотите создать изображение, назвать его mariadb и пометить как dev (=mariadb:dev).

Ваш Dockerfile основан на изображении mariadb с тегом latest ( FROM mariadb:latest ).

Поэтому Docker сначала должен вытащить mariadb:latest из концентратора docker. После этого шага этот образ появится в вашем локальном реестре. После создания образа ( mariadb:dev ) этот образ также находится в вашем локальном реестре.

Вот почему у вас есть и то, и другое в вашем реестре. mariadb:latest -это базовое изображение для вашего изображения. Поэтому Docker должен вытащить это изображение на первом шаге вашего Dockerfile. И так оно и есть в вашем реестре.

Это поведение задокументировано в официальных документах Docker

```
db:
   image: mariadb:latest
   volumes:
      - "<relativePath>:/var/lib/mysql"
   environment:
      - MYSQL_ROOT_PASSWORD=password
```

где <relativePath> -относительный путь от места, где находится ваш docker-compose.yml / где вы выполняете docker-compose up . Например, вы можете создать подпапку "mysql", содержащую все файлы, которые вы хотите смонтировать в /var/lib/mysql внутри контейнера, а затем использовать - "mysql:/var/lib/mysql" . (Используя вместо этого . , вы получите mount docker-compose.yml и все, что находится в одной папке, в /var/lib/mysql внутри контейнера)

**Volume:**

<img width="683" alt="Screenshot 2021-07-23 at 12 41 10" src="https://github.com/DaDvoy/Inception/blob/basicPart/srcs/informationDockerCompose/image/types-of-mounts-volume.png">
  
*Ответ с форума:*

С local driver volume появляется возможность использовать произвольные крепления; Используя крепление для привязки, вы можете добиться именно этого.

Для настройки именованного тома, в который монтируется /srv/db-data, ваш docker-compose.yml будет выглядеть так:

```
version: '2'
services:
  db:
    image: mysql
    volumes:
      - dbdata:/var/lib/mysql
volumes:
  dbdata:
    driver: local
    driver_opts:
      type: 'none'
      o: 'bind'
      device: '/srv/db-data'
```

Я не тестировал его с версией 2 формата файла compose, но https://docs.docker.com/compose/compose-file/compose-versioning/#version-2 не указывает, что он не должен работать.

