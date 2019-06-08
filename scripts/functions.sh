#!/usr/bin/env ash

function prepareDatadir {
  datadir=$1
  etherbase=$2
  if [ ! -d $datadir/geth ]; then
    echo "----------> A new data directory will be created!"
    geth --datadir $datadir \
         --etherbase $etherbase \
         --networkid "18021982" \
         --gasprice "1" \
         --targetgaslimit "0x59a5380" \
         init genesis.json
  fi
}
