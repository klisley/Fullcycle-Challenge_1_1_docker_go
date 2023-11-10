FROM golang:1.21-bookworm AS builder

WORKDIR /app

COPY go.* ./
RUN go mod download
COPY *.go ./
RUN go build -o /hello_fullcycle 


# New build stage
FROM scratch

WORKDIR /

COPY --from=builder /hello_fullcycle /hello_fullcycle

EXPOSE 8080

ENTRYPOINT ["/hello_fullcycle"]