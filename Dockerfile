FROM golang:1.17-alpine as builder
WORKDIR /app
COPY . .
RUN go build -o main fullcycle.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .

CMD ["/app/main"]