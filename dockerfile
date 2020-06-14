FROM golang:alpine3.12 as builder

RUN mkdir /app
RUN chmod 700 /app

COPY . /app

RUN go build -o /app/main /app/main.go

FROM golang:alpine3.12

COPY --from=builder /app/ .

#VOLUME /static
EXPOSE 3000

CMD ["./main"]
