FROM golang:1.17.5-alpine as dev

ENV ROOT=/go/src/app
ENV CGO_ENABLED 0
ENV GO111MODULE=on 
WORKDIR ${ROOT}

RUN apk update && apk add git
RUN go mod init main && go mod tidy

# Golang モジュールダウンロード
RUN go mod download
# Golang ホットリロード(freshのインストール)
RUN go get github.com/pilu/fresh

EXPOSE 8080

CMD ["fresh", "-c", ".fresh.conf"]


FROM golang:1.15.7-alpine as builder

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