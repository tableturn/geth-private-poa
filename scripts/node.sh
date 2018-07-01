#!/usr/bin/env ash
. ./scripts/functions.sh

bootnode=$(getent hosts bootnode | awk '{print $1}')
datadir=/root/.ethereum
etherbase=$1
addresses="0x627306090abab3a6e1400e9345bc60c78a8bef57,0xf17f52151ebef6c7334fad080c5704d77216b732,0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef,0x821aea9a577a9b44299b9c15c88cf3087f3b5544,0x0d1d4e623d10f9fba5db95830f7d3839406c6af2,0x2932b7a2355d6fecc4b5c0b6bd44cc31df247a2e,0x2191ef87e392377ec08e7c08eb105ef5448eced5,0x0f4f2ac550a1b4e2280d04c21cea7ebd822934b5,0x6330a553fc93768f612722bb8c2ec78ac90b3bbc,0x5aeda56215b167893e80b4fe645ba6d5bab767de"

mkdir -p $datadir/keystore
cp -R /keystore $datadir
prepareDatadir $datadir $etherbase

geth --datadir $datadir \
     --etherbase $etherbase \
     --networkid "18021982" \
     --gasprice "0" \
     --targetgaslimit "0x59A5380" \
     --rpc --rpcaddr '0.0.0.0' --rpcport 8545 --rpccorsdomain '*' --rpcapi 'admin,db,eth,miner,net,web3,personal,txpool' \
     --ws --wsaddr '0.0.0.0' --wsport 8546 --wsorigins '*' \
     --bootnodes "enode://f94118749beb981da38b82ab6be7b00dc0082783d698080fd0ae45a2c3d42f1ce74cbb153ffcfb1379b64235605bfff43f85b112032ddd9685ad2ab88735e1b1@${bootnode}:30301" \
     --unlock $addresses \
     --password "/dev/null" \
     --verbosity 3
