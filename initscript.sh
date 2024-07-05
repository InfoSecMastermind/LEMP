#!/bin/bash

# Update existing list of packages
sudo apt update

# Install prerequisite packages
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common net-tools

# Add the GPG key for the official Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the Docker repository to APT sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update existing list of packages again
sudo apt update

# Install Docker CE
sudo apt install -y docker-ce

# Pull the Docker image
sudo docker pull dodocker111/ct:ct

# Run Docker container in detached mode
sudo docker run -d -p 80:80 dodocker111/ct:ct
