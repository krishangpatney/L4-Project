#!/bin/bash

# Install (& starts) basic dependencies. (Requires sudo perms)
# curl, git, docker, docker-compose, apache2, python, pip, sysstat

echo 'Doing something'
apt update

# Installs
apt install -y curl git 

#fetch docker install script and run script
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

echo 'Doing something'
#fetch docker-compose script and install docker compose
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Install and run load generation
git clone -b load-gen https://github.com/krishangpatney/robot-shop.git

cd robot-shop/load-gen

chmod +x load-gen.sh  
echo 'gets here'

./load-gen.sh 100 5m $1 > load_output.txt 
# ./load-gen.sh 100 5m $1 >> load_output.txt &
