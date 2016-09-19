#!/bin/sh

su homeassistant -s /bin/bash -c "python3 -m venv /srv/homeassistant && source /srv/homeassistant/bin/activate && pip3 install homeassistant" && \
systemctl enable home-assistant@homeassistant.service && \
sync && \
systemctl disable install_homeassistant && \
rm /etc/systemd/system/install_homeassistant.service && \
rm /usr/local/bin/install_homeassistant.sh && \
systemctl daemon-reload && \
systemctl start home-assistant@homeassistant.service
