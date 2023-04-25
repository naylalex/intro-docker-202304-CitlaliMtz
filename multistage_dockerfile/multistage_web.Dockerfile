FROM golang:latest  as builder
WORKDIR /frontend
COPY dispatcher.go .
COPY static .
RUN go build dispatcher.go

FROM alpine:latest 
COPY --from=builder /frontend /static
CMD ["./dispatcher"]