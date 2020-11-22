#!/bin/bash

if  !   which mysql > /dev/null; then
        sudo apt update -y
        sudo apt install mysql-client-core-5.7 -y
        mysql --version

else
        echo "sql is already installed"
fi