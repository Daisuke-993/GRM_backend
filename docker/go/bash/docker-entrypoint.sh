#!/bin/bash

# # Detecting uid and gid of the '${DOCKER_USER}' user inside Docker container
GO_UID_DEFAULT=$(id -u ${DOCKER_USER})
GO_GID_DEFAULT=$(id -g ${DOCKER_USER})

echo "[!!] Checking UID and GID. Docker host user is ${GO_UID}:${GO_GID}, '${DOCKER_USER}' is ${GO_UID_DEFAULT}:${GO_GID_DEFAULT}."

if [[ "${GO_UID}" != "0" ]] && [[ "${GO_UID}" != "${GO_UID_DEFAULT}" ]]; then
    echo "[!!] Need to change UID and GID for '${DOCKER_USER}'."
    usermod  -u ${GO_UID} ${DOCKER_USER} \
        && groupmod -g ${GO_GID} ${DOCKER_USER} \
        && echo "[!!] UID and GID changed. '${DOCKER_USER}' is now $(id -u ${DOCKER_USER}):$(id -g ${DOCKER_USER})." \
        || { echo "[!!] *** FAILED SETTING UID AND GID FOR '${DOCKER_USER}'! ***"; exit 1; }
else
    echo "[!!] UID and GID are OK!"
fi

# Update and install Go modules
go mod tidy

# Run http server as hot reload
air -c .air.toml