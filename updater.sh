#!/usr/bin/env bash
cd "$(dirname "$0")"
rm -r *
wget https://ipfs.io/ipns/link/file.zip
unzip ./file.zip
rm ./file.zip
