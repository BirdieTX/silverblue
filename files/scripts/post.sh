#!/usr/bin/env bash

set -oue pipefail

dconf update
systemctl disable NetworkManager-wait-online.service
systemctl enable grub-config.service
systemctl enable bluebird-pin-deployment.timer
dnf5 upgrade --allow-vendor-change --refresh -y
dnf5 config-manager setopt '*.enabled=0'
source /usr/lib/os-release
sed -i "s/^PRETTY_NAME=.*/PRETTY_NAME=\"Fedora Linux ${VERSION_ID} (Silverblue)\"/" /usr/lib/os-release
plymouth-set-default-theme bgrt-mac-style