#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Usage: nuclei-web.sh <urls.txt>"
    exit 0
fi

outfolder="nuclei-web"
targets=$1

mkdir $outfolder
categories=("technologies" "exposed-panels" "exposures" "cves" "default-logins" "misconfiguration" "vulnerabilities" "takeovers" "iot")

for c in ${categories[@]}; do
    echo "[*] Scanning for $c"
    nuclei -l $targets -t $c -irr -markdown-export $outfolder/$c -o $outfolder/$c.log
    echo "[*] Scan for $c completed"
    echo
done