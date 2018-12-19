FROM golang:1.11 as builder

ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.io

WORKDIR /app
COPY go.* ./

RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build

# final stage
FROM scratch
COPY --from=builder /app/httpserver /app/
EXPOSE 8080
ENTRYPOINT ["/app/httpserver"]