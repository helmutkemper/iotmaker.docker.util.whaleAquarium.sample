FROM golang:alpine3.12 as builder

RUN mkdir /app
RUN chmod 700 /app

COPY . /app

#ARG CGO_ENABLED=0
RUN go build -i -o /app/main /app/main.go

FROM scratch

COPY --from=builder /app/ .

#VOLUME /static
EXPOSE 3000

CMD ["/main"]
