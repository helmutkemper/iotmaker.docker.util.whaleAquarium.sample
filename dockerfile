FROM golang:latest

RUN mkdir /app
RUN chmod 700 /app

COPY . /app

RUN mkdir /app/static
RUN chmod 700 /app/static

WORKDIR /app

VOLUME /app/static
EXPOSE 3000

RUN go build -o ./main ./main.go

CMD ["./main"]
