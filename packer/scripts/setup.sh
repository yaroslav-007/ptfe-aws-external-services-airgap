#!/usr/bin/env bash
set -x

apt-get update
apt-get upgrade -y
apt-get install ctop htop -y

apt install /home/ubuntu/ptfe-ec2/*.deb -y

mkdir /home/ubuntu/ptfe-ec2/replicated
tar xzf /home/ubuntu/ptfe-ec2/replicated.tar.gz -C /home/ubuntu/ptfe-ec2/replicated
cp /home/ubuntu/ptfe-ec2/replicated.conf /etc/replicated.conf
