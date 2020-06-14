FROM golang:alpine3.12 as builder

RUN mkdir /app
RUN chmod 700 /app

COPY . /app

RUN go build -o /app/main /app/main.go

FROM scratch

RUN mkdir /app
RUN chmod 700 /app

COPY --from=builder /app/ /app/

#VOLUME /static
EXPOSE 3000

WORKDIR /app

CMD ["/app/main"]
