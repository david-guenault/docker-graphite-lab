build:
	docker-compose build

up:
	docker-compose up -d

down: 
	docker-compose down

killcontainers:
	@-docker kill $$(docker ps -q)

clearvolumes:
	@-docker volume rm $$(docker volume ls | grep -v "^DRIVER" | awk '{print $$2}')

reset: down clearvolumes up ps

ps: 
	docker-compose ps

logs: 
	docker-compose logs

rebuild_cache:
	docker-compose build --no-cache cache1

rebuild_web:
	docker-compose build --no-cache graphiteweb2

rebuild_base:
	docker-compose build --no-cache base

rebuild_webfront2:
	docker-compose build --no-cache graphiteweb2front

rebuild: down clearvolumes clearcontainers clearorphanedimages
	rebuild_base
	rebuild_cache
	rebuild_web
	rebuild_lb
	rebuild_traefik

rebuild_grafana:
	docker-compose build --no-cache grafana1

rebuild_lb:
	docker-compose build --no-cache lb

rebuild_traefik:
	docker-compose build --no-cache traefik

clearorphanedimages:
	@-docker rmi $$(docker images | grep none | awk '{print $$3})

clearcontainers: killcontainers
	@-docker rm $$(docker ps -qa)

