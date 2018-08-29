FROM       alpine:latest
EXPOSE     9216

ENV GOPATH /go
ENV APPPATH $GOPATH/src/github.com/percona/mongodb_exporter
ENV MONGODB_EXPORTER_VERSION 0.6.1

WORKDIR $APPPATH
ADD https://github.com/percona/mongodb_exporter/archive/$MONGODB_EXPORTER_VERSION.tar.gz .
RUN tar xzf $MONGODB_EXPORTER_VERSION.tar.gz  \
    && mv mongodb_exporter-$MONGODB_EXPORTER_VERSION/* . \
    && rm -f $MONGODB_EXPORTER_VERSION.tar.gz \
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

ENV MONGODB_URL='mongodb://post_db:27017'

ENTRYPOINT [ "/bin/mongodb_exporter" ]
