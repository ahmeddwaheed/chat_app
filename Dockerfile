FROM ruby:2.5.5-alpine

MAINTAINER Ahmed Waheed <ahmed.waheed56@gmail.com>

RUN apk update && apk add build-base mariadb-dev nodejs tzdata libxslt-dev libxml2-dev less

WORKDIR /app

COPY Gemfile* /app/

RUN gem install bundler
RUN bundle install

COPY . /app/

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
