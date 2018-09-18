ARG MONGODB_EXPORTER_VERSION=0.6.1
FROM       alpine:latest
EXPOSE     9216

ARG MONGODB_EXPORTER_VERSION
ENV GOPATH /go
ENV APPPATH $GOPATH/src/github.com/percona/mongodb_exporter

WORKDIR $APPPATH
ADD https://github.com/percona/mongodb_exporter/archive/v$MONGODB_EXPORTER_VERSION.tar.gz .
RUN tar xzf v$MONGODB_EXPORTER_VERSION.tar.gz  \
    && mv mongodb_exporter-$MONGODB_EXPORTER_VERSION/* . \
    && rm -f v$MONGODB_EXPORTER_VERSION.tar.gz \
    && apk add --update --no-cache -t build-deps \
        go \
        git \
        libc-dev \
        gcc \
        libgcc \
    && go get -d \
    && go build -o /bin/mongodb_exporter \
    && apk del --purge build-deps \
    && rm -rf $GOPATH

ENTRYPOINT [ "/bin/mongodb_exporter" ]
