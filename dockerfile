FROM golang:alpine3.12 as builder

RUN mkdir /app
RUN chmod 700 /app

COPY . /app

RUN mkdir /app/static
RUN chmod 700 /app/static

WORKDIR /app

RUN go build -o /app/main /app/main.go

#FROM scratch

#COPY --from=builder /app .

VOLUME /app/static
EXPOSE 3000

CMD ["main"]
