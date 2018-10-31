#!/bin/bash -e

install -d "${ROOTFS_DIR}/var/run/lirc"
rm -f "${ROOTFS_DIR}/etc/lirc/lircd.conf.d/devinput.lircd.conf"

install -m 644 files/i2c1-bcm2708.dtbo "${ROOTFS_DIR}/boot/overlays"

install -m 644 files/config.txt "${ROOTFS_DIR}/boot/config.txt"
install -m 644 files/lirc_options.conf "${ROOTFS_DIR}/etc/lirc/lirc_options.conf"
install -m 644 files/lirc24.conf "${ROOTFS_DIR}/etc/lirc/lircd.conf.d/lirc24.conf"
install -m 644 files/lirc44.conf "${ROOTFS_DIR}/etc/lirc/lircd.conf.d/lirc44.conf"
install -m 644 files/Samsung_BN59-00678A.conf "${ROOTFS_DIR}/etc/lirc/lircd.conf.d/Samsung_BN59-00678A.conf"
install -m 644 files/AppConfig.json "${ROOTFS_DIR}/home/pi/AppConfig.json"

install -m 755 files/setup.sh "${ROOTFS_DIR}/home/pi/setup.sh"

rm -f "${ROOTFS_DIR}/etc/default/keyboard"
install -m 644 files/keyboard "${ROOTFS_DIR}/etc/default/keyboard"
