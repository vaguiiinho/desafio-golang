FROM golang:1.13-alpine3.11 AS builder 
WORKDIR /app 
COPY . . 
RUN go mod init app 
RUN CGO_ENABLED=0 GOOS=linux go build main.go

FROM scratch
WORKDIR /app 
COPY --from=builder /app . 
ENTRYPOINT ["./main"]