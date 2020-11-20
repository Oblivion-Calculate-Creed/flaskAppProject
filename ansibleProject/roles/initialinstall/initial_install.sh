#!/bin/bash

if [ ! -f usr/bin/python3 ]; then
    sudo apt-get update
    sudo apt install -y python3-pip
    sudo apt-get install -y mysql-client
    sudo apt-get install -y python-pytest
fi