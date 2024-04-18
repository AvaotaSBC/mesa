#!/bin/bash

sudo apt update
sudo apt install -y qemu-user-static
docker build -t mesa-jammy .
docker run -itd --name mesa-jammy mesa-jammy:latest
docker cp mesa-jammy:/workspace/*deb .
