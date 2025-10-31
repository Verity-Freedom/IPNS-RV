#!/usr/bin/env bash
cd "$(dirname "$0")"
cp -r ./user-config ~/user-config
rm -r *
curl https://ipfs.io/ipns/link/file.zip -O
unzip ./file.zip
rm ./file.zip
cp -r ~/user-config ./user-config
rm -r ~/user-config
