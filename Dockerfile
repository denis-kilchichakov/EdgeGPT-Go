FROM golang:1.20-alpine as builder

LABEL org.opencontainers.image.source=https://github.com/pavel-one/EdgeGPT-Go

WORKDIR /app

COPY ./ ./

RUN go mod download
RUN go build -o /tmp/build cli/main.go

RUN rm -rf *

RUN mv /tmp/build /app/build

CMD ["/app/build grpc"]
