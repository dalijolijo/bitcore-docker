#!/usr/bin/env bash

sed -i -- "s/\"livenet\"/\"${BITCOIN_NETWORK}\"/g" ./bitcore.json
./node_modules/.bin/bitcored -c ./bitcore-node.json
