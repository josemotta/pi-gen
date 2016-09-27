#!/bin/bash -e

on_chroot sh -e - <<EOF
systemctl disable mosquitto
EOF
