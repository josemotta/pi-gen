#!/bin/sh
set -e

# Home Setup
DOCKER_COMPOSE="$HOME/home/Docker/docker-compose"
KEY_USER="josemotta@bampli.com"
KEY_FILE="/home/pi/.ssh/id_rsa"

# Docker-compose
cp $DOCKER_COMPOSE /usr/local/bin
chown root:root /usr/local/bin/docker-compose
chmod 0755 /usr/local/bin/docker-compose

# Hassio
curl -sL https://raw.githubusercontent.com/dale3h/hassio-installer/master/hassio_rpi3bp | bash -s

# User pi
usermod -aG docker pi

# SSH
ssh-keygen -t rsa -b 4096 -C $KEY_USER -q -N "" -f $KEY_FILE
