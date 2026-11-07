#!/usr/bin/env bash
# This script uses 'dnf config-manager' to rename all of the repositories
# on the image and sets priority levels for all repositories in order
# to have more granular control over upgrades and package installations.
# After runnning config-manager, a system upgrade is run with dnf.

set -oue pipefail

# Set repository names
dnf5 config-manager setopt \
  copr:copr.fedorainfracloud.org:ublue-os:packages.name='Ublue Packages' \
  copr:copr.fedorainfracloud.org:ublue-os:staging.name='Ublue Staging' \
  fedora.name='Fedora Core' \
  fedora-cdrtools.name='CDR Tools' \
  fedora-cdrtools-debug.name='CDR Tools (debug)' \
  fedora-cdrtools-source.name='CDR Tools (source)' \
  fedora-cisco-openh264.name='Cisco OpenH264' \
  fedora-cisco-openh264-debuginfo.name='Cisco OpenH264 (debug)' \
  fedora-cisco-openh264-source.name='Cisco OpenH264 (source)' \
  fedora-debuginfo.name='Fedora Core (debug)' \
  fedora-multimedia.name='Fedora Multimedia' \
  fedora-multimedia-debug.name='Fedora Multimedia (debug)' \
  fedora-multimedia-source.name='Fedora Multimedia (source)' \
  fedora-nvidia.name='Fedora Nvidia' \
  fedora-nvidia-debug.name='Fedora Nvidia (debug)' \
  fedora-nvidia-source.name='Fedora Nvidia (source)' \
  fedora-rar.name='RAR Archiver' \
  fedora-rar-debug.name='RAR Archiver (debug)' \
  fedora-rar-source.name='RAR Archiver (source)' \
  fedora-source.name='Fedora Core (source)' \
  fedora-spotify.name='Spotify Client' \
  fedora-spotify-debug.name='Spotify Client (debug)' \
  fedora-spotify-source.name='Spotify Clent (source)' \
  fedora-steam.name='Steam Client' \
  fedora-steam-source.name='Steam Client (debug)' \
  fedora-steam-debug.name='Steam Client (source)' \
  fedora-uld.name='Samsung Unified Linux Driver' \
  fedora-uld-debug.name='Samsung Unified Linux Driver (debug)' \
  fedora-uld-source.name='Samsung Unified Linux Driver (source)' \
  terra.name='Fyra Labs Terra' \
  terra-mesa.name='Fyra Labs Mesa' \
  terra-mesa-source.name='Fyra Labs Mesa (source)' \
  updates.name='Fedora Updates' \
  updates-archive.name='Archived Updates' \
  updates-debuginfo.name='Fedora Updates (debug)' \
  updates-source.name='Fedora Updates (source)' \
  updates-testing.name='Fedora Test Updates' \
  updates-testing-debuginfo.name='Fedora Test Updates (debug)' \
  updates-testing-source.name='Fedora Test Updates (source)'

# Priority levels
dnf5 config-manager setopt \
    copr:copr.fedorainfracloud.org:ublue-os:packages.priority=109 \
    copr:copr.fedorainfracloud.org:ublue-os:staging.priority=108 \
    fedora.priority=99 \
    fedora-cdrtools.priority=85 \
    fedora-cdrtools-debug.priority=85 \
    fedora-cdrtools-source.priority=85 \
    fedora-cisco-openh264.priority=97 \
    fedora-cisco-openh264-debuginfo.priority=97 \
    fedora-cisco-openh264-source.priority=97 \
    fedora-debuginfo.priority=99 \
    fedora-multimedia.priority=89 \
    fedora-multimedia-debug.priority=89 \
    fedora-multimedia-source.priority=89 \
    fedora-nvidia.priority=83 \
    fedora-nvidia-debug.priority=83 \
    fedora-nvidia-source.priority=83 \
    fedora-rar.priority=88 \
    fedora-rar-debug.priority=88 \
    fedora-rar-source.priority=88 \
    fedora-source.priority=99 \
    fedora-spotify.priority=87 \
    fedora-spotify-debug.priority=87 \
    fedora-spotify-source.priority=87 \
    fedora-steam.priority=86 \
    fedora-steam-source.priority=86 \
    fedora-steam-debug.priority=86 \
    fedora-uld.priority=84 \
    fedora-uld-debug.priority=84 \
    fedora-uld-source.priority=84 \
    terra.priority=79 \
    terra-mesa.priority=78 \
    terra-mesa-source.priority=78 \
    updates.priority=98 \
    updates-archive.priority=119 \
    updates-debuginfo.priority=98 \
    updates-source.priority=98 \
    updates-testing.priority=98 \
    updates-testing-debuginfo.priority=98 \
    updates-testing-source.priority=98

dnf5 upgrade --allow-vendor-change