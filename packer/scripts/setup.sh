#!/usr/bin/env bash
apt-get update
apt-get upgrade -y

apt-get install -y ctop htop

apt install -y /home/ubuntu/assets/*.deb

mkdir -p /home/ubuntu/assets/replicated/
tar xzf /home/ubuntu/assets/replicated.tar.gz -C /home/ubuntu/assets/replicated/

cp /home/ubuntu/assets/replicated.conf /etc/replicated.conf
