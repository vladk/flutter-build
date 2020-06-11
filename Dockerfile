FROM debian:buster-slim

ENV FLUTTER_CHANNEL=master

WORKDIR /

RUN apt-get update -y
RUN apt-get install -y \
  git \
  bash \
  curl \
  unzip \
  lcov

RUN git clone -b master https://github.com/flutter/flutter.git
  
ENV PATH=$PATH:/flutter/bin/cache/dart-sdk/bin:/flutter/bin

RUN flutter config  --no-analytics

RUN flutter precache

RUN flutter doctor -v
