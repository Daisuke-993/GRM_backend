include .env

HOST_UID                 := $(shell id -u)
HOST_GID                 := $(shell id -g)
DOCKER_BRIDGE_HOST_IP    := $(shell docker network inspect bridge --format='{{(index .IPAM.Config 0).Gateway}}')
DOCKER_COMPOSE_VARS      := DOCKER_BRIDGE_HOST_IP=$(DOCKER_BRIDGE_HOST_IP) HOST_UID=$(HOST_UID) HOST_GID=$(HOST_GID)

DOCKER_APP_CONTAINER := grm-app
DOCKER_MYSQL_CONTAINER := grm-mysql

cc:
	$(DOCKER_COMPOSE_VARS) docker-compose build --no-cache

restart:
	$(DOCKER_COMPOSE_VARS) docker-compose up --force-recreate --build --abort-on-container-exit

start:
	$(DOCKER_COMPOSE_VARS) docker-compose up

up:
	$(DOCKER_COMPOSE_VARS) docker-compose up -d

rebuild:
	$(DOCKER_COMPOSE_VARS) docker-compose up -d --force-recreate --build

down:
	$(DOCKER_COMPOSE_VARS) docker-compose down

app-root: up
	docker exec -it ${DOCKER_APP_CONTAINER} sh || true

app-docker-user: up
	docker exec --user=docker -it ${DOCKER_APP_CONTAINER} sh || true

mysql-root: up
	docker exec -it ${DOCKER_MYSQL_CONTAINER} bash || true

mysql-cli: up
	docker exec -it ${DOCKER_MYSQL_CONTAINER} mysql -p${DB_PASS} || true
