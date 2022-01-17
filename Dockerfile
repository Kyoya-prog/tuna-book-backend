FROM ruby:3.0.2

RUN apt-get update -qq && \
  apt-get install -y build-essential \
  nodejs\
  default-mysql-server\
  default-mysql-client

WORKDIR /tuna-book

COPY Gemfile /tuna-book/Gemfile
COPY Gemfile.lock /tuna-book/Gemfile.lock

RUN gem install bundler
RUN bundle install

RUN mkdir -p tmp/sockets