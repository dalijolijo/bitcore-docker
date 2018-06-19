
FROM node:carbon

RUN apt-get update && apt-get install -y \
  g++ \
  libzmq3-dev \
  libzmq3-dbg \
  libzmq3 \
  make \
  python \
  wget \
  vim

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
  node_modules/btxcore/test \
  node_modules/btxcore/bin/bitcore-*/bin/bitcore-qt \
  node_modules/btxcore/bin/bitcore-*/bin/test_bitcore \
  node_modules/btxcore/bin/bitcore-*-linux64.tar.gz \
  /dumb-init_*.deb \
  /root/.npm \
  /root/.node-gyp \
  /tmp/* \
  /var/lib/apt/lists/*

VOLUME /root/bitcore/data
ENV BITCORE_NETWORK livenet
ENTRYPOINT ["./starter.sh"]
