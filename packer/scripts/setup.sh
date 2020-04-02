#!/usr/bin/env bash
set -x

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install ctop htop -y


sudo apt install /home/ubuntu/ptfe-ec2/*.deb -y



sudo mkdir /home/ubuntu/ptfe-ec2/replicated
sudo tar xzf /home/ubuntu/ptfe-ec2/replicated.tar.gz -C /home/ubuntu/ptfe-ec2/replicated
sudo cp /home/ubuntu/ptfe-ec2/replicated.conf /etc/replicated.conf