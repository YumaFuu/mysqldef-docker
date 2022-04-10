FROM alpine:3.15 as builder

ENV VERSION 0.11.49

RUN apk add --no-cache curl tar \
    && curl -sL https://github.com/k0kubun/sqldef/releases/download/v$VERSION/mysqldef_linux_arm64.tar.gz -o mysqldef.tar.gz \
    && tar -zxf mysqldef.tar.gz

FROM scratch
COPY --from=builder /mysqldef /usr/local/bin/mysqldef
ENTRYPOINT ["mysqldef"]
