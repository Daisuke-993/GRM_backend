FROM golang:latest as dev

ENV ROOT=/go/src/app
ENV CGO_ENABLED 0
ENV GO111MODULE=on
WORKDIR ${ROOT}
COPY ./src/ ${ROOT}

ENV GO_UID=1000
ENV GO_GID=1000
ENV DOCKER_USER=${GO_UID}

# コンテナ内に名称dockerでグループを作成
RUN groupadd -g ${GO_GID} docker
# コンテナ内に名称dockerでdockerグループに所属するユーザーを作成
RUN useradd -u ${GO_UID} -g ${GO_GID} -s /bin/bash -m docker

# Install hot reload tool
RUN go install github.com/cosmtrek/air@v1.29.0

# Install migration tool
RUN go install github.com/pressly/goose/v3/cmd/goose@latest

COPY ./docker/go/bash/docker-entrypoint.sh /
RUN chown ${GO_UID}:${GO_GID} /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8080


FROM golang:latest as builder

ENV ROOT=/go/src/app
WORKDIR ${ROOT}

RUN apk update && apk add git
COPY go.mod go.sum ./
RUN go mod download

COPY . ${ROOT}
RUN CGO_ENABLED=0 GOOS=linux go build -o $ROOT/binary


FROM scratch as prod

ENV ROOT=/go/src/app
WORKDIR ${ROOT}
COPY --from=builder ${ROOT}/binary ${ROOT}

EXPOSE 8080
CMD ["/go/src/app/binary"]
