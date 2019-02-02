FROM ubuntu:16.04
MAINTAINER Brandon Johnson <brandon@apptys.com>

# Cache bundle install step so it doesn't run on rebuild
WORKDIR /tmp
ADD Gemfile /tmp/Gemfile
ADD Gemfile.lock /tmp/Gemfile.lock

RUN apt-get update && apt-get install -y \
  lsof netcat

RUN bundle install -j4

ADD . /dry-restful-api

WORKDIR /dry-restful-api

ONBUILD RUN rm -rf /dry-restful-api
