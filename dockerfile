FROM golang:latest

RUN mkdir /app
RUN chmod 700 /app

COPY . /app

WORKDIR /app

VOLUME ./static ./static
EXPOSE 8080

RUN go build -o ./main ./main.go

CMD ["./main"]
