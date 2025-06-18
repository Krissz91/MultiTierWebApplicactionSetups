#!/bin/bash

sudo dnf install epel-release -y
sudo dnf install redis -y
sudo sed -i 's/^bind 127\.0\.0\.1 -::1/bind 0.0.0.0/' /etc/redis.conf
sudo sed -i 's/^protected-mode yes/protected-mode no/' /etc/redis.conf
sudo systemctl start redis
sudo systemctl enable redis
sudo systemctl status redis
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --add-port=6379/tcp --permanent
sudo firewall-cmd --reload
