FROM ubuntu:14.04

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git \
    cmake pkg-config libprotoc-dev libprotobuf8 protobuf-compiler \
    libprotobuf-dev libosmpbf-dev libpng12-dev libtbb-dev libbz2-dev \
    libstxxl-dev libstxxl-doc libstxxl1 libxml2-dev libzip-dev \
    libboost-all-dev lua5.1 liblua5.1-0-dev libluabind-dev libluajit-5.1-dev

RUN mkdir -p /build
RUN git clone git://github.com/DennisOSRM/Project-OSRM.git /src

WORKDIR /build
RUN cmake /src
RUN make
RUN ln -s /src/profiles/car.lua profile.lua
RUN ln -s /src/profiles/lib/

EXPOSE 5000
