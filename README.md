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
git clone <git repo>
docker-compose up -d
docker ps
```

### Image rebuild
After changes in the Dockerfile, docker-compose.yml or the config.json you must rebuild the image.
To rebuild the image on your system you must use `docker-compose build` or `docker-compose up --build`.
