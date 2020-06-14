FROM golang:alpine3.12 as builder

RUN mkdir /app
RUN chmod 700 /app

COPY . /app

WORKDIR /app

RUN go build -o /app/main /app/main.go

FROM scratch

RUN mkdir /app
RUN chmod 700 /app

COPY --from=builder /app /app

VOLUME /app/static
EXPOSE 3000

CMD ["/app/main"]
