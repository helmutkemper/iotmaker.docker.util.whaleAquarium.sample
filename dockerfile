FROM golang:alpine3.12 as builder

RUN mkdir /app
RUN chmod 700 /app

COPY . /app

WORKDIR /app

VOLUME /app/static
EXPOSE 3000

RUN go build -o ./main ./main.go

#FROM scratch

#COPY --from=builder /app /app

#VOLUME /app/static
#EXPOSE 3000

$WORKDIR /app

ENTRYPOINT ["./main"]
