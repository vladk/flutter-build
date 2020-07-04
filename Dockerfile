FROM kvlad/android-sdk

ENV FLUTTER_CHANNEL=dev
ENV FLUTTER_VERSION=1.20.0-2.0.pre-${FLUTTER_CHANNEL}

WORKDIR /

RUN apt-get update -y
RUN apt-get install -y \
  git \
  xz-utils \
  wget \
  lcov

RUN wget --quiet --output-document=flutter.tar.xz https://storage.googleapis.com/flutter_infra/releases/${FLUTTER_CHANNEL}/linux/flutter_linux_${FLUTTER_VERSION}.tar.xz \
    && tar xf flutter.tar.xz -C / \
    && rm flutter.tar.xz
  
ENV PATH=$PATH:/flutter/bin/cache/dart-sdk/bin:/flutter/bin

RUN flutter config  --no-analytics

RUN flutter precache

RUN flutter doctor -v

