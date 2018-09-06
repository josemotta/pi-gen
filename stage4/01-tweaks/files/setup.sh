#!/bin/sh
set -e

# Home Setup
#DUCKDNS_DOMAIN="canoas.duckdns.org"
#DUCKDNS_TOKEN="8ce54352-8105-46e6-a82b-1317812fd6ca"
#DUCKDNS_SSL="y"
REPO_HOME="https://github.com/josemotta/IoT.Home.Pi.git"
HOME="/home/pi/IoT.Home.Pi/"
DOCKER_COMPOSE="$HOME/home/Docker/docker-compose"
KEY_USER="josemotta@bampli.com"
KEY_FILE="/home/pi/.ssh/id_rsa"

# Hassbian scripts
#     samba:   file server
#     duckdns: dynamic dns
hassbian-config install samba
hassbian-config install duckdns << EOF
canoas.duckdns.org
8ce54352-8105-46e6-a82b-1317812fd6ca
y
EOF

# IoT.Home.Pi
git clone $REPO_HOME $HOME

# Docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
#groupadd docker
usermod -aG docker pi

#Docker-compose
cp $DOCKER_COMPOSE /usr/local/bin
chown root:root /usr/local/bin/docker-compose
chmod 0755 /usr/local/bin/docker-compose

#SSH
ssh-keygen -t rsa -b 4096 -C $KEY_USER -q -N "" -f $KEY_FILE

