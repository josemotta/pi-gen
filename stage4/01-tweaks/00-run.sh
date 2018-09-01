#!/bin/bash -e

install -d "${ROOTFS_DIR}/var/run/lirc"
rm -f "${ROOTFS_DIR}/etc/lirc/lircd.conf.d/devinput.*"

install -m 644 files/config.txt "${ROOTFS_DIR}/boot/config.txt"
install -m 644 files/lirc_options.conf "${ROOTFS_DIR}/etc/lirc/lirc_options.conf"
install -m 644 files/ir-remote.conf "${ROOTFS_DIR}/etc/modprobe.d/ir-remote.conf"
install -D files/remotes "${ROOTFS_DIR}/etc/lirc/lircd.conf.d"
install -m 644 files/AppConfig.json "${ROOTFS_DIR}/app"


