#!/bin/sh
set -e

# Install dependencies
# - hassbian scripts
#     samba:   file server
#     duckdns: dynamic dns
# - docker

# Hassbian
DUCKDNS_DOMAIN="canoas.duckdns.org"
DUCKDNS_TOKEN="8ce54352-8105-46e6-a82b-1317812fd6ca"
DUCKDNS_SSL="y"

hassbian-config install samba
hassbian-config install duckdns << EOF
$DUCKDNS_DOMAIN
$DUCKDNS_TOKEN
$DUCKDNS_SSL
EOF

# Docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh

