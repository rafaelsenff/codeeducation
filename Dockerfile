FROM golang:1.17 as builder

RUN mkdir /app
COPY . /app

WORKDIR /app
RUN go build -o my-golang-app

FROM scratch
WORKDIR /app
COPY --from=builder /app .

CMD ["/app/my-golang-app"]