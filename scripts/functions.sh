#!/usr/bin/env ash

function prepareDatadir {
  datadir=$1
  etherbase=$2
  if [ ! -d $datadir/geth ]
  then
    geth --datadir $datadir \
        --etherbase $etherbase \
        --networkid "18021982" \
        --gasprice "0" \
        --targetgaslimit "0x59A5380" \
        init genesis.json
  fi
}
