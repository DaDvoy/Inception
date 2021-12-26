DOC_FILES=srcs/docker-compose.yml

create_volume:
	mkdir -p /home/${USER}/data/mariadb
	mkdir -p /home/${USER}/data/wordpress
	
build: create_volume
		docker-compose -f $(DOC_FILES) build

up:
		docker-compose -f $(DOC_FILES) up -d