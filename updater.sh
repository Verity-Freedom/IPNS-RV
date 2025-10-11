#!/usr/bin/env bash
cd "$(dirname "$0")"
rm -r *
curl https://ipfs.io/ipns/link/file.zip -O
unzip ./file.zip
rm ./file.zip
