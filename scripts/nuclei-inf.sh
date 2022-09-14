#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Usage: nuclei-inf.sh <ips.txt>"
    exit 0
fi

outfolder="nuclei-inf"
targets=$1

mkdir $outfolder
categories=("network")

for c in ${categories[@]}; do
	echo "[*] Scanning for $c"
	nuclei -l $targets -t $c -irr -markdown-export $outfolder/$c -o $outfolder/$c.log
	echo "[*] Scan for $c completed"
	echo
done