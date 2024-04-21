#!/bin/sh

## This script is intended to setup multiple tools inside of a linux (debian) environment

## Perform an update of apt-get and then perform an install 
## of curl, wget, gnupg2, and libdigest-sha-perl to make your life easierf
sudo apt-get update
sudo apt-get install -y curl wget gnupg2 libdigest-sha-perl

## Install the following pieces of software for working with kubernetes
echo "Installing kubectl..."
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.*.0/bin/linux/amd64/kubectl
wget https://storage.googleapis.com/kubernetes-release/release/v1.*.0/bin/linux/amd64/kubectl -q --show-progress
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo "Installing minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

echo "Installing k6..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
echo "deb https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
sudo apt-get update
sudo apt-get install k6

## Install the following pieces of development languages and tools
echo "Installing jq..."
sudo apt-get -y install jq

echo "Installing node..."
sudo apt-get -y install nodejs

echo "Installing Go..."
curl -OL https://go.dev/dl/go1.19.linux-amd64.tar.gz
sudo mv ./go1.19.linux-amd64.tar.gz /usr/local
sudo rm -rf /usr/local/go && tar -C /usr/local -xvf /usr/local/go1.19.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin