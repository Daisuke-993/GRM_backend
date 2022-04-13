FROM golang:latest as dev

ENV ROOT=/go/src/app
ENV CGO_ENABLED 0
ENV GO111MODULE=on
WORKDIR ${ROOT}
COPY ./src/ ${ROOT}

# RUN go get main \
#     && go install -v \
#     && go mod tidy

COPY ./docker/go/bash/docker-entrypoint.sh /
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
