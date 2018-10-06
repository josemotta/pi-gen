#!/bin/sh
set -e

# Home Setup
REPO="https://github.com/josemotta/IoT.Home.Pi.git"
HOME="/home/pi/IoT.Home.Pi"

git clone $REPO $HOME
