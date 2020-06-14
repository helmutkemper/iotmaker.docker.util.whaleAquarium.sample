FROM golang:alpine3.12 as builder

RUN mkdir /app
RUN chmod 700 /app

COPY . /app

RUN go build -o /app/main /app/main.go

FROM scratch

COPY --from=builder /app/main .

RUN mkdir /static
RUN chmod 700 /static

VOLUME /static
EXPOSE 3000

ENTRYPOINT ["./main"]
