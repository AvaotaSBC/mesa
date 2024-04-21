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
git config --global user.name "GitHub Actions"
git config --global user.email "actions@github.com"
git init
git add .
git add -f .github
git remote add origin https://github.com/AvaotaSBC/mesa.git
git branch -M jammy-devel
git commit -m "${DATE} mesa-pkg update"
