## Docker for Bitcore Insight

### Install docker-compose for Ubuntu 16.04
Check latest release here: https://github.com/docker/compose/releases
```
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
docker-compose --version
```

### Start docker container
```
git clone https://github.com/dalijolijo/bitcore-docker.git
docker-compose up -d
docker ps
```

### Image rebuild
After changes in the Dockerfile, docker-compose.yml or the config.json you must rebuild the image.

__For example:__ You want to install `vim` inside the docker container. Edit the `Dockerfile` and add `vim` to `apt-get install -y`:

```
FROM node:carbon

RUN apt-get update && apt-get install -y \
  g++ \
  libzmq3-dev \
  libzmq3-dbg \
  libzmq3 \
  make \
  python \
  vim
```

To rebuild the image on your docker-host you must only execute:
```
docker-compose build
```

You can update your running docker container with:
```
docker-compose up -d
  Recreating bitcore-docker_bitcore_1 ... done
```
