#!/bin/bash

sudo apt update
sudo apt install -y qemu-user-static
docker build -t mesa-jammy .
docker run -itd --name mesa-jammy mesa-jammy:latest
docker cp mesa-jammy:/workspace .
mkdir mesa-repo
cp workspace/*.deb mesa-repo

git clone https://github.com/AvaotaSBC/mesa.git -b jammy-devel mesa-repo-tmp
cp mesa-repo-tmp/.git mesa-repo
cd mesa-repo
git add .
git add -f .github
git commit -m "${DATE} mesa-pkg update"
