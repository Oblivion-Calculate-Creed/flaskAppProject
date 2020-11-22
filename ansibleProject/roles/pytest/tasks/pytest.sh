#!/bin/bash

if  !   which pytest > /dev/null; then
        sudo apt update -y
        sudo apt install python-pytest -y
        pytest --version

else
        echo "pytest is already installed"
fi