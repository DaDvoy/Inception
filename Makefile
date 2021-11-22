all:
		docker-compose -f ./srcs/docker-compose.yaml build
# --build - создает образы докеров перед запуском контейнеров.
# Флаг --force-recreate принудительно остановит запущенные в данный
# момент контейнеры и снова запустит все контейнеры, даже если нет
# никаких изменений в его конфигурации
		docker-compose -f ./srcs/docker-compose.yaml up
# up - запускает контейнеры

clean:
		docker-compose down ./srcs/docker-compose.yaml down
fclean:

ps:
		docker-compose ./srcs/docker-compose.yaml ps
#up:
#		docker-compose