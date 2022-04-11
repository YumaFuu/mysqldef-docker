FROM golang:1.17 as builder
RUN mkdir /app
COPY . /app/
WORKDIR /app
RUN git clone https://github.com/k0kubun/sqldef.git
WORKDIR sqldef
RUN CGO_ENABLED=0 make build BUILD_DIR=build

FROM scratch
COPY --from=builder /app/sqldef/build/mysqldef /usr/local/bin/mysqldef
ENTRYPOINT ["mysqldef"]
