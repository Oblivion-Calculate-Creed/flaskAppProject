#!/bin/bash
 
if ! which aws > /dev/null; then
 
 sudo apt update
 sudo apt install awscli -y
 
else 
 
 echo "awscli is already installed"
 
fi
 
aws --version