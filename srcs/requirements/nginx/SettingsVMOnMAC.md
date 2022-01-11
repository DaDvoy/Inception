# Настройка VM на mac

*1) Создание VM *

- Выбираете название, расположение vm выбирайте goinfree(лучше там сделать отдельную папку где будет хранится наше окружение),
тип - линукс, версию я выбрала debian64(https://www.debian.org/download), так как использовала его образ;

- Memory size лучше выбирайте не меньше 2000;

- выбирайте "Create a virtual hard disk now";

- "VDI";

- "Dynamically allocated";

- Дальше выбирайте не менее 30 гб памяти;

- После заходите в настройки нашей машины, в "display" - video memory до 128 MB. В storage,
в "Controller: IDE" добавляете скачанный образ(его тоже лучше хранить в goinfree).
В network выбираем advanced - port fofrwarding, создаете новый: host port - любой больше 1000, guest port - 22(ssh). Нажимаете OK.


*2) Настройка внутри VM*

- Я выбирала графическую инсталяцию;

- Дальше везде русский язык(или любой другой удобный для вас);
- Имя компьютера ваш ник, имя домена (ник или ник.42.fr), пароль ставьте самый простой(поверьте, вы порадуетесь этому позже),
новый пользователь также свой ник и такой же пароль(так просто удобнее).
- Разметка дисков - " Авто - использовать весь диск"; "Все файлы в одном разделе";
"Записать изменения на диск" - да;
- Дальше пропускаем все пункты до "Выбор програмнного обеспечения", убираем GNOME, добавляем Xfce и SSH-сервер; 
- Снова протыкиваем пункты.

*3) Загрузка софта внутрь машины*

- Открываем обычный терминал на компе(не в vm), пишем ssh lmushroo@localhost -p <число которое вы прописали при настройки вм как "host host">;

- Если вылетает ошибка "WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!"(напримерб когда вы настраиваете вм на несколько компов),
то переходите по пути который прописан в ошибке, например, такой: "/Users/<твой ник>/.ssh/known_hosts"
и удаляете строчку с тем хост портом  который прописан в предупреждение.

- Когда вы вошли в вм через терминал, проверьте установлен ли у вас судо, это можно сделать такой командой `sudo --help`,
если в терминале показываются возможные вариации использования этой команды, то всё ок.

- Дальше даем права нашему юзеру(вам), пишем `su - root`, после пишем `adduser <твой ник> sudo`, и перезагружаем вм этой командой `reboot`.

- Снова заходим в вм через терминал. Для того чтобы нам скачать докер и докер-компоуз, нам нужен `curl`,
для этого прописываем команду `sudo apt install curl`.

- Далее прописываем команды для подкачки докера(инфа с оф,сайта - https://docs.docker.com/engine/install/debian/):
    - `sudo apt-get update`;
    - 
    ``` 
    sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    ```
    - `curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg`;
    - `echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`
    - `sudo apt-get update`
    - `sudo apt-get install docker-ce docker-ce-cli containerd.io`;
    - Проверяем что докер установился командой `sudo docker -v`.

- Для проверки работоспособности докера пробуем скачать образ:
  - `docker run hello-world`;
  - Если вылезает ошибка об отсутствие прав, то даем их с помощью `sudo adduser <твой ник> docker";
  - Снова перезагружаем: `sudo reboot`.
  
- Снова заходим в вм и пробуем скачать образ:
  - `docker run hello-world`;
  - с помощью `docker images` проверяем наличие скачанного образа.
  
- Следующие командa для установки докер-компоуз(https://docs.docker.com/compose/install/):
  - `sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose`;
  - `sudo chmod +x /usr/local/bin/docker-compose`;
  - Проверяем что всё установилось `docker-compose --version`.
  
- Скачиваем vim `sudo apt-get install vim`;

- Из корня переходим в директорию `cd ../../etc`, затем с помощью `sudo vim hosts` меняем localhost на `<твой ник>.42.fr`.

- Подгружаем git чтобы скачивать/пушить проекты на гитхаб `sudo apt install git`.

*4) Для настройки работы в вм через VisualStudio*

- Заходим в настройки вижуал студио, и находим settings.json;

- Добавляем туда:
```
"remotefs.remote": {
        "Inseption": {
        "scheme": "sftp",
        "host": "localhost",
        "username": "<твой ник>",
        "port": <твой host port>,
        "rootPath": "/home/<твой ник>",
    }
```
