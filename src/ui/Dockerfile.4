FROM alpine:3.5
RUN apk update && apk upgrade && apk --update --no-cache add \
    curl-dev ruby-dev build-base \
    ruby ruby-bundler

ENV APP_HOME /app
WORKDIR $APP_HOME

COPY Gemfile* $APP_HOME/
RUN bundle install
COPY . $APP_HOME

ENV POST_SERVICE_HOST post
ENV POST_SERVICE_PORT 5000
ENV COMMENT_SERVICE_HOST comment
ENV COMMENT_SERVICE_PORT 9292

CMD ["puma"]
