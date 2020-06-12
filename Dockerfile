# FROM gcr.io/bitnami-containers/minideb-extras:jessie-r14
# COPY app-code/http-sample /app/http-sample
# USER bitnami
# WORKDIR /app
# EXPOSE 3000
# ENTRYPOINT ["/app/http-sample"]


FROM golang:alpine AS builder
LABEL stage=builder
RUN apk add --no-cache gcc libc-dev
WORKDIR /workspace
COPY ./app-code/http-sample.go .
RUN ls && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .
RUN ls

FROM scratch
WORKDIR /root/
COPY --from=builder /workspace/app .

EXPOSE 3000
ENTRYPOINT ["./app"]
