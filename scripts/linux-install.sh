#!/bin/bash

set -e #u -o pipefail # fail on error and report it, debug all lines

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo privilege to run this script"

## This script is intended to setup multiple tools inside of a linux (debian) environment

## Perform an update of apt-get and then perform an install 
## of curl, wget, gnupg2, and libdigest-sha-perl to make your life easierf
sudo apt-get update
sudo apt-get install -y curl wget gnupg2 libdigest-sha-perl

## Install the following pieces of software for working with kubernetes
echo "Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo kubectl version --client --output=yaml

echo "Installing minikube..."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
sudo minikube version

## Install the following pieces of development languages and tools
echo "Installing Development Languages"
while read -r tools ; do sudo apt-get install -y $tools ; done < <(cat << "EOF"
    jq
    nodejs
    ruby-full
EOF
)

# Confirm versions of installed tools
echo "The installed version of Ruby is ..."
sudo ruby --version
echo "The installed version of Node is ..."
sudo nodejs --version
echo "The installed version of jq is ..."
sudo jq --version

# echo "Installing Go..."
# curl -OL https://go.dev/dl/go1.19.linux-amd64.tar.gz
# sudo mv ./go1.19.linux-amd64.tar.gz /usr/local
# sudo rm -rf /usr/local/go && tar -C /usr/local -xvf /usr/local/go1.19.linux-amd64.tar.gz
# export PATH=$PATH:/usr/local/go/bin