FROM ubuntu:20.04

LABEL maintainer="Matt Budish <matt.budish@digikey.com>"

# Install build tools

RUN apt update && apt upgrade -y && \
    apt install -yq build-essential curl git libssl-dev ninja-build

RUN curl -sL https://github.com/Kitware/CMake/releases/download/v3.20.5/cmake-3.20.5.tar.gz | \
    tar xz -C /tmp && \
    cd /tmp/cmake-3.20.5 && \
    ./bootstrap && \
    make && make install && \
    cd / && rm -rf /tmp/cmake-3.20.5

# Install Oat++ libraries

RUN cd /tmp && git clone https://github.com/oatpp/oatpp.git && \
    cd oatpp && \
    mkdir build && cd build && \
    cmake .. && make install && \
    cd / && rm -rf /tmp/oatpp

# Build this project

COPY . /opt/simplest-project

RUN cd /opt/simplest-project && \
    cmake -B build -G Ninja && \
    cmake --build build

EXPOSE 8000

CMD ["/opt/simplest-project/build/simplest-project-exe"]