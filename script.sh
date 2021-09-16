#!/bin/bash

# Update system
apt update && apt upgrade -y
hostnamectl set-hostname kong-Api
sleep 2

# install Docker
apt  install docker.io -y
usermod -aG docker ubuntu 
clear
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
mkdir -p /home/ubuntu/kong
cd /home/ubuntu/kong
wget https://raw.githubusercontent.com/marcio-machado76/lab_terraform_aws_kong-api-gateway/feature/script/docker-compose.yaml
docker-compose up -d
