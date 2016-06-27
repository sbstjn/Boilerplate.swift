FROM ubuntu:trusty

# Set environment variables for image
ENV SWIFT_SNAPSHOT swift-3.0-preview-1

# Linux OS dependencies
RUN apt-get update && apt-get install -y \
  automake \
  build-essential \
  clang \
  curl \
  gcc-4.8 \
  git \
  g++-4.8 \
  libbsd-dev \
  libcurl4-gnutls-dev \
  libcurl3 \
  libglib2.0-dev \
  libicu-dev \
  libtool \
  openssh-client \
  wget \
  && rm -rf /var/lib/apt/lists/*

# Install Swift compiler
RUN wget -nv https://swift.org/builds/$SWIFT_SNAPSHOT/ubuntu1404/$SWIFT_SNAPSHOT/$SWIFT_SNAPSHOT-ubuntu14.04.tar.gz \
  && tar xzvf $SWIFT_SNAPSHOT-ubuntu14.04.tar.gz \
  && rm $SWIFT_SNAPSHOT-ubuntu14.04.tar.gz
ENV PATH /$SWIFT_SNAPSHOT-ubuntu14.04/usr/bin:$PATH

COPY . /code
CMD cd /code && swift build && swift test
