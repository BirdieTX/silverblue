#!/usr/bin/env bash

set -oue pipefail

dnf5 config-manager setopt \
    copr:copr.fedorainfracloud.org:ublue-os:packages.priority=109 \
    updates-archive.priority=100 \
    fedora.priority=99 \
    updates.priority=98 \
    fedora-cisco-openh264.priority=97 \
    terra.priority=89 \
    fedora-multimedia.priority=88 \
    terra-mesa.priority=87 \
    copr:copr.fedorainfracloud.org:ublue-os:packages.name='Universal Blue' \
    fedora.name='Fedora Core' \
    fedora-cisco-openh264.name='Cisco OpenH264' \
    fedora-multimedia.name='Fedora Multilib' \
    terra.name='Fyra Labs Terra' \
    terra-mesa.name='Fyra Labs Mesa' \
    updates.name='Fedora Updates' \
    updates-archive.name='Fedora Updates (Archive)'
