#!/bin/bash -e
on_chroot sh -e - <<EOF
useradd -u 999 -g 999 -rm homeassistant
EOF

install -v -o 999 -g 999 -d		${ROOTFS_DIR}/srv/homeassistant
install -m 644 files/home-assistant@homeassistant.service		${ROOTFS_DIR}/etc/systemd/system/
install -m 755 files/install_homeassistant.service		${ROOTFS_DIR}/etc/systemd/system/
install -m 755 files/install_homeassistant.sh		${ROOTFS_DIR}/usr/local/bin/

on_chroot sh -e - <<EOF
systemctl enable install_homeassistant.service
EOF

on_chroot sh -e - << \EOF
for GRP in video gpio; do
  adduser homeassistant $GRP
done
EOF
