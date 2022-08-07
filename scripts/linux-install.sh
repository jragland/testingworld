#!/bin/sh

# The following script is intended to help developers get the prerequisite tools
# installed on their system so they can setup, locally, the api-gateway repo

# Perform an update of apt-get and then perform an upgrade of apt-get
sudo apt-get update
# Commenting this out at this time as we are seeing weird issues in a test EC2 instance
# sudo apt-get -y upgrade

# Install packages that are needed by the api-gateway repo
echo "Installing packages for use with api-gateway"

echo "Install kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.22.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

echo "Install istioctl"
curl -sL https://istio.io/downloadIstioctl | sh -
export PATH=$HOME/.istioctl/bin:$PATH

echo "Install Go"
sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo apt-get -y install golang-go

# Currently running into isssues with this - need to continue invetigating
echo "Install Overmind"
sudo apt-get -y install tmux
sudo go install github.com/DarthSim/overmind/v2@latest

echo "Install jq"
sudo apt-get -y install jq

echo "Install node"
sudo apt-get -y install nodejs

echo "Install minikube"
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb

# Currently running into issues with this - gpg command needs to be ran before you can add the keyring
echo "Install k6"
sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
sudo apt-get update
sudo apt-get -y install k6