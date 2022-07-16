FROM ruby:3.1.2

COPY . /app
WORKDIR /app

RUN set -eux \
    && bundle config --local set path 'vendor/bundle' \
    && bundle install
