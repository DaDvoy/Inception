all:
		# mkdir -p /home/lmushroo/data/mariadb
		docker-compose -f ./srcs/docker-compose.yml --env-file src/.env build
# --build - создает образы докеров перед запуском контейнеров.
# Флаг --force-recreate принудительно остановит запущенные в данный
# момент контейнеры и снова запустит все контейнеры, даже если нет
# никаких изменений в его конфигурации
up:
		docker-compose -f ./srcs/docker-compose.yml --env-file src/.env up
# up - запускает контейнеры

clean:
		docker-compose down ./srcs/docker-compose.yml down
fclean:  clean
	docker rmi -f $(docker images -qa)
	docker volume rm $(docker volume ls -q)
	docker system prune -a --force

ps:
		docker-compose ./srcs/docker-compose.yml ps
#up:
#		docker-compose