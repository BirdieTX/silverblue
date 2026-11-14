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
  fedora-cisco-openh264.name='Cisco OpenH264' \
  fedora-cisco-openh264-debuginfo.name='Cisco OpenH264 (debug)' \
  fedora-cisco-openh264-source.name='Cisco OpenH264 (source)' \
  fedora-debuginfo.name='Fedora Core (debug)' \
  fedora-multimedia.name='Fedora Multimedia' \
  fedora-multimedia-debug.name='Fedora Multimedia (debug)' \
  fedora-multimedia-source.name='Fedora Multimedia (source)' \
  fedora-rar.name='RAR Archiver' \
  fedora-rar-debug.name='RAR Archiver (debug)' \
  fedora-rar-source.name='RAR Archiver (source)' \
  fedora-source.name='Fedora Core (source)' \
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
    fedora-cisco-openh264.priority=97 \
    fedora-cisco-openh264-debuginfo.priority=97 \
    fedora-cisco-openh264-source.priority=97 \
    fedora-debuginfo.priority=99 \
    fedora-multimedia.priority=89 \
    fedora-multimedia-debug.priority=89 \
    fedora-multimedia-source.priority=89 \
    fedora-rar.priority=88 \
    fedora-rar-debug.priority=88 \
    fedora-rar-source.priority=88 \
    fedora-source.priority=99 \
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