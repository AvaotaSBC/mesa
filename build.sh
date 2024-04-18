#!/bin/bash

sudo apt update
sudo apt install -y qemu-user-static
docker build -t mesa-jammy .
docker cp mesa-jammy:/workspace/*deb .
