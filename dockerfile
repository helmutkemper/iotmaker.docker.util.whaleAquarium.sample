FROM golang:alpine3.12 as builder

RUN mkdir /app
RUN chmod 700 /app

COPY . /app

WORKDIR /app

RUN go build -o /app/main /app/main.go

FROM scratch

COPY --from=builder /app /
COPY --from=builder /app/static /static

#VOLUME /static
EXPOSE 3000

CMD ["/main"]
