#!/usr/bin/env bash


# See: https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-engine---community-1

# Update the apt package index:
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS:
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker's official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

# Add the "stable" or "edge" repository to work with your version of Ubuntu
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
#  edge"
sudo apt update

sudo apt install -y docker-ce docker-ce-cli containerd.io

