## Docker for Bitcore

Install docker-compose for Ubuntu 16.04. Check latest release here: https://github.com/docker/compose/releases
```
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
docker-compose --version
```

Clone this and run:
```
docker-compose up -d
docker ps
```
