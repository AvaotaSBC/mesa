#!/bin/bash

sudo apt update
sudo apt install -y qemu-user-static
docker build -t mesa-jammy .
docker run -itd --name mesa-jammy mesa-jammy:latest
docker cp mesa-jammy:/workspace .
mkdir mesa-repo
cp workspace/*.deb mesa-repo

DATE=$(date)
cd mesa-repo
git init
git add .
git add -f .github
git commit -m "${DATE} mesa-pkg update"
