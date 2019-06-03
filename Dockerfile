#This file creates a small image with rails installed.
#The only purpose is for development to run rails commands
#Use a production Dockerfile for deployment!

FROM ruby:2.6-alpine

RUN apk update \
    && apk add nodejs yarn build-base linux-headers git postgresql-dev tzdata \
    && rm -rf /var/cache/apk/*

RUN bundle config --local build.nokogiri --use-system-libraries && bundle config --local job 10
RUN gem install rails -v 6.0.0-rc1

WORKDIR /app