FROM golang:alpine3.12 as builder

RUN mkdir /app
RUN chmod 700 /app

COPY . /app

WORKDIR /app

RUN go build -o ./main ./main.go

FROM scratch

COPY --from=builder /app .

VOLUME /static
EXPOSE 3000

ENTRYPOINT ["./main"]
