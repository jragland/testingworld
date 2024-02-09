#!/bin/sh

# This script is intended to setup multiple tools inside of a linux (debian) environment

# Perform an update of apt-get and then perform an install 
# of curl, wget, gnupg2, and libdigest-sha-perl to make your life easierf
sudo apt-get update
sudo apt-get install -y curl
sudo apt-get install -y wget
sudo apt-get install -y gnupg2
sudo apt-get install -y libdigest-sha-perl

# Install the following pieces of software
echo "Installing the following packages"

echo "Install kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.*.0/bin/linux/amd64/kubectl
wget https://storage.googleapis.com/kubernetes-release/release/v1.*.0/bin/linux/amd64/kubectl -q --show-progress
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl


# Likely going to remove the istio stuff
# echo "Install istioctl"
# curl -LO https://istio.io/downloadIstioctl | sh - 

# echo "Configure istioctl to work with your PATH"
# export PATH=$HOME/.istioctl/bin:$PATH
# env

##############################################################################################################################
# echo "Install jq"
# sudo apt-get -y install jq

# echo "Install node"
# sudo apt-get -y install nodejs

# echo "Install minikube"
# curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
# sudo dpkg -i minikube_latest_amd64.deb

# echo "Install k6"
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
# echo "deb https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
# sudo apt-get update
# sudo apt-get install k6

# echo "Install Go"
# curl -OL https://go.dev/dl/go1.19.linux-amd64.tar.gz
# sudo mv ./go1.19.linux-amd64.tar.gz /usr/local
# sudo rm -rf /usr/local/go && tar -C /usr/local -xvf /usr/local/go1.19.linux-amd64.tar.gz
# export PATH=$PATH:/usr/local/go/bin

# # Currently running into isssues with this - need to continue invetigating
# echo "Install Overmind"
# sudo apt-get -y install tmux
# wget https://github.com/DarthSim/overmind/releases/download/v2.3.0/overmind-v2.3.0-linux-amd64.gz
# gunzip -d overmind-v2.3.0-linux-amd64.gz
# sudo chmod +x overmind-v2.3.0-linux-amd64
# sudo mv overmind-v2.3.0-linux-amd64 /usr/local/bin/
# sudo ln -s /usr/local/bin/overmind-v2.3.0-linux-amd64 /usr/bin/overmind



