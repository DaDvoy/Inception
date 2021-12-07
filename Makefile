DOC_FILES=srcs/docker-compose.yml

create_volume:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress
	
build: create_volume
		docker-compose -f $(DOC_FILES) build $(c)
# --build - создает образы докеров перед запуском контейнеров.
# Флаг --force-recreate принудительно остановит запущенные в данный
# момент контейнеры и снова запустит все контейнеры, даже если нет
# никаких изменений в его конфигурации
up:
		docker-compose -f $(DOC_FILES) up $(c)
# up - запускает контейнеры

clean:
		docker-compose down $(DOC_FILES) down $(c)

fclean:  clean
	docker rmi -f $(docker images -qa)
	docker volume rm $(docker volume ls -q)
	docker system prune -a --force

ps:
		docker-compose $(DOC_FILES) ps
#up:
#		docker-compose