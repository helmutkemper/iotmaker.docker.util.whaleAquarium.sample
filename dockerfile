FROM golang:alpine3.12 as builder

RUN mkdir /app
RUN chmod 700 /app

RUN mkdir /app/static
RUN chmod 700 /app/static

COPY . /app

WORKDIR /app

RUN go build -o ./main ./main.go

FROM scratch

COPY --from=builder /app .

RUN mkdir /app/static
RUN chmod 700 /app/static


VOLUME /app/static
EXPOSE 3000

ENTRYPOINT ["./main"]
