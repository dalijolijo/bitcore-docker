#!/usr/bin/env bash

sed -i -- "s/\"livenet\"/\"${BITCORE_NETWORK}\"/g" /root/config.json
/root/node_modules/.bin/btxcore start -c /root/config.json
