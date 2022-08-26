#!/usr/bin/env ash

function prepareDatadir {
  datadir=$1
  etherbase=$2
  if [ ! -d $datadir/geth ]; then
    echo "----------> A new data directory will be created!"
    geth --datadir $datadir \
         --networkid "18021982" \
         --miner.etherbase $etherbase \
         --miner.gasprice "1" \
         --miner.gaslimit "0x59a5380" \
         init genesis.json
  fi
}
