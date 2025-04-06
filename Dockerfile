FROM ubuntu:latest AS builder

ENV USER root
RUN mkdir /work
WORKDIR /work
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y gcc g++ cmake git bison \
flex
RUN git clone --branch 1.1.4 https://github.com/awesomized/libmemcached.git libmemcached
RUN mkdir build
WORKDIR /work/build
RUN cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/memcached-awesome ../libmemcached  -DCMAKE_BUILD_TYPE=Release 
RUN make
RUN mkdir /opt/memcached-awesome
RUN make install

FROM ubuntu:latest
COPY --from=builder /opt/memcached-awesome /opt/memcached-awesome
ENTRYPOINT ["/opt/memcached-awesome/bin/memcapable", "-b", "-t", "10", "-v", "-h", "127.0.0.1", "-p", "11211"]