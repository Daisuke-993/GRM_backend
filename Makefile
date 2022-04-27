include .env

DOCKER_APP_CONTAINER := grm-app
DOCKER_MYSQL_CONTAINER := grm-mysql

cc:
	docker-compose build --no-cache

restart:
	docker-compose up --force-recreate --build --abort-on-container-exit

up:
	docker-compose up -d

rebuild:
	docker-compose up -d --force-recreate --build

down:
	docker-compose down

app-root: up
	docker exec -it ${DOCKER_APP_CONTAINER} sh || true

mysql-root: up
	docker exec -it ${DOCKER_MYSQL_CONTAINER} bash || true

mysql-cli: up
	docker exec -it ${DOCKER_MYSQL_CONTAINER} mysql -p${DB_PASS} || true
