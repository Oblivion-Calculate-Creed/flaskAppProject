#!/bin/bash
if [ ! -f usr/bin/docker ]; then
    curl https://get.docker.com | sudo bash
    sudo usermod -aG docker ubuntu
fi