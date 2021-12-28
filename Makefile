DOC_FILES=srcs/docker-compose.yml

create_volume:
	mkdir -p /home/${USER}/data/mariadb
	mkdir -p /home/${USER}/data/wordpress
	
build: create_volume
		docker-compose -f $(DOC_FILES) build

up:
		docker-compose -f $(DOC_FILES) up -d
con_clear:
		docker stop $(docker ps -a -q)
im_clear:
		docker rmi $(docker images -a) -f