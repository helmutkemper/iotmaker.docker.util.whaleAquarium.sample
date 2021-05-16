FROM golang:alpine3.12 as builder

RUN mkdir /app
RUN chmod 700 /app

COPY . /app

# import golang packages to be used inside image "scratch"
ARG CGO_ENABLED=0
RUN go build -ldflags="-w -s" -o /app/main /app/main.go


FROM golang:alpine3.12

COPY --from=builder /app/ .

VOLUME /static
EXPOSE 3000

CMD ["/main"]
