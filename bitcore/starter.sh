#!/usr/bin/env bash

sed -i -- "s/\"livenet\"/\"${BITCOIN_NETWORK}\"/g" /root/config.json
/root/node_modules/.bin/bitcore start -c /root/config.json
