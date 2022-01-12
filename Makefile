DOC_FILES=srcs/docker-compose.yml

create_volume:
	mkdir -p /home/${USER}/data/mariadb
	mkdir -p /home/${USER}/data/wordpress
	
build: create_volume
		docker-compose -f $(DOC_FILES) build

up:
	docker-compose -f $(DOC_FILES) up -d

clean:
	docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
#	docker network rm $$(docker network ls -q) \
	2> /dev/null	