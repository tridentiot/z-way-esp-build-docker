FROM debian:stable
ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    wget \
    unzip \
    openssh-client \
    python3 \
    python3-pip \
    pkg-config \
    libtool \
    autoconf \
    automake \
    cmake \
    hashdeep \
    software-properties-common \
    python3-launchpadlib \
    flex bison gperf \
    python3-venv ninja-build ccache libffi-dev dfu-util libusb-1.0-0 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir ~/esp && cd ~/esp && \
    git clone -b v5.3.1 --recursive https://github.com/espressif/esp-idf.git && \
    cd esp-idf && \
    ./install.sh
    
WORKDIR /build
