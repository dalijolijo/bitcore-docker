
FROM node:carbon

RUN apt-get update && apt-get install -y \
  g++ \
  libzmq3-dev \
  libzmq3-dbg \
  libzmq3 \
  make \
  python

EXPOSE 3001 8333
HEALTHCHECK --interval=5s --timeout=5s --retries=10 CMD curl -f http://localhost:3001/insight/

WORKDIR /root
COPY bitcore ./
RUN npm config set package-lock false && npm install --production

RUN apt-get purge -y \
  g++ make python gcc && \
  apt-get autoclean && \
  apt-get autoremove -y

RUN rm -rf \
  node_modules/bitcore/test \
  node_modules/bitcore/bin/bitcoin-*/bin/bitcoin-qt \
  node_modules/bitcore/bin/bitcoin-*/bin/test_bitcoin \
  node_modules/bitcore/bin/bitcoin-*-linux64.tar.gz \
  /dumb-init_*.deb \
  /root/.npm \
  /root/.node-gyp \
  /tmp/* \
  /var/lib/apt/lists/*

VOLUME /root/bitcoin/data
ENV BITCOIN_NETWORK livenet
ENTRYPOINT ["./starter.sh"]
