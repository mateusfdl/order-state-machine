FROM ruby:2.7.2-alpine3.13 
RUN apk add --no-cache --update \
  build-base \
  postgresql-dev\
  tzdata \
  nodejs \
  yarn 
RUN mkdir /server
WORKDIR /server
COPY . /server
RUN bundle install
