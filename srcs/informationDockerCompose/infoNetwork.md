**Наглядная иерархия параметров в Docker Compose**

Стоит учитывать, что многие параметры в представленном ниже описании конфликтуют, но они были описаны вместе для удоства и понимания иерархии параметров.

```networks:

# Имя default для реконфигурации стандартной сети для Compose имя сети:
# Типы драйверов: bridge, overlay  
driver: overlay
# attachable работает только в Compose 3.2+
attachable: true
# параметры драйвера (см. документацию драйвера)
driver_opts:
	foo: "bar"
	baz: 1
# Поддержка IPv6 не доступна в Compose 3, только 2.
enable_ipv6: true
# Настройка IPAM конфигурации
ipam:
	# драйвер IPAM заместо default если нужно
	driver: default
	# Конфигурация с 0 и больше блоков, содержащая ключ subnet:
	config:
	- subnet: 172.28.0.0/16
	- subnet: 192.168.10.0/24

# Делает сеть изолированной
internal: true

# Использование сети, созданной вне Compose.
# Если параметр external имеет флаг true, то это указывает Compose, что сеть была создана извне. docker-compose up ее не создаст и если не найдет, то выкинет ошибку.
# external не может быть использован с другими ключами конфигурации (driver, driver_opts, ipam, internal)
external: true

# Для external можно задать имя для использования в Compose файле начиная с версии 3.5:
external:
	name: actual-name-of-network

# Так же с версии 3.5 можно задать имя сети даже с спецсимволами:
network1:
# Использование файла external так же работает в купе с заданным именем сети
external: true
name: my-app-net

# Метаданные для контейнера могут быть созданы с помощью Docker labels: это массив или словарь.
labels:
	com.example.description: "Financial transaction network"
	com.example.department: "Finance"
	com.example.label-with-empty-value: ""
