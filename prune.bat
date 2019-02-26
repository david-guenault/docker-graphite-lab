docker-compose -f %1 down
docker container prune
docker image prune
docker volume prune