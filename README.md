# Docker image for libmemcached-awesome library

## Building docker image

Docker image contains only one binary, so image is pretty small(~80MB). To be able to build docker image additional memory needs to be granted to container that builds final image. Building docker image is divided in 2 stages. 

To build docker image memcrsd sources have to be cloned and `docker build -m 512m .` command executed:

```sh
git clone git@github.com:memc-rs/libmemcached-awesome.git libmemcached-awesome
cd libmemcached-awesome
docker build .  -t memcrs/memcached-awesome:1.1.4
```

## Publishing docker image

```sh
docker images
# tag docker image
docker tag memcrs/memcached-awesome:1.1.4 memcrs/memcached-awesome:latest
docker push memcrs/memcached-awesome:latest
docker push memcrs/memcached-awesome:1.1.4
```
