#!/usr/bin/env bash

sed -i -- "s/\"livenet\"/\"${BITCOIN_NETWORK}\"/g" bitcore-node.json
node_modules/.bin/bitcore start -c bitcore-node.json
