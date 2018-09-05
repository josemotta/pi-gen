#!/bin/sh
set -e

DUCKDNS_DOMAIN="canoas.duckdns.org"
DUCKDNS_TOKEN="8ce54352-8105-46e6-a82b-1317812fd6ca"
DUCKDNS_SSL="y"
DOCKER_COMPOSE="/home/pi/IoT.Home.Thing/home/Docker/docker-compose"

# Install dependencies
# - hassbian scripts
#     samba:   file server
#     duckdns: dynamic dns
# - docker

# Hassbian
hassbian-config install samba
hassbian-config install duckdns << EOF
canoas.duckdns.org
8ce54352-8105-46e6-a82b-1317812fd6ca
y
EOF

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
ssh-keygen -t rsa -b 4096 -C "josemotta@bampli.com" -q -N "" -f /home/pi/.ssh/id_rsa

