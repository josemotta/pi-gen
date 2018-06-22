#!/bin/bash -e

on_chroot << EOF
groupadd -f -r -g 1001 homeassistant
useradd -u 1001 -g 1001 -rm homeassistant
EOF

install -v -o 1001 -g 1001 -d ${ROOTFS_DIR}/srv/homeassistant

# Download latest Hassbian-scripts package
cd /tmp
curl https://api.github.com/repos/home-assistant/hassbian-scripts/releases/latest | grep "browser_download_url.*deb" | cut -d : -f 2,3 | tr -d \" | wget -qi -
HASSBIAN_PACKAGE=$(ls /tmp| grep 'hassbian*')
install -v -m 600 /tmp/$HASSBIAN_PACKAGE ${ROOTFS_DIR}/srv/homeassistant/
rm $HASSBIAN_PACKAGE

on_chroot << EOF
dpkg -i /srv/homeassistant/*.deb
EOF

on_chroot << EOF
systemctl enable install_homeassistant
EOF

on_chroot << \EOF
for GRP in dialout gpio i2c input netdev spi video; do
        adduser homeassistant $GRP
done
for GRP in homeassistant; do
  adduser pi $GRP
done
EOF

