FROM ruby:2.7.2-alpine3.13 AS builder
RUN apk add --no-cache --update \
  build-base \
  postgresql-dev\
  tzdata
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN bundle install
