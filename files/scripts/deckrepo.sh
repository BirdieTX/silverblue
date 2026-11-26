#!/usr/bin/env bash

set -oue pipefail

dnf5 config-manager setopt \
  copr:copr.fedorainfracloud.org:ublue-os:bazzite.name='Bazzite' \
  copr:copr.fedorainfracloud.org:ublue-os:bazzite-multilib.name='Bazzite Multilib' \
  copr:copr.fedorainfracloud.org:ycollet:audinux.name='Audinux' \
  terra-extras.name='Fyra Labs Extras' \
  terra-mesa.name='Fyra Labs Mesa' \
  terra-mesa-source.name='Fyra Labs Mesa (source)' \

dnf5 config-manager setopt \
  copr:copr.fedorainfracloud.org:ublue-os:bazzite.priority=89 \
  copr:copr.fedorainfracloud.org:ublue-os:bazzite-multilib.priority=88 \
  copr:copr.fedorainfracloud.org:ycollet:audinux.priority=119 \
  fedora-multimedia.priority=79 \
  fedora-multimedia-debug.priority=79 \
  fedora-multimedia-source.priority=79 \
  terra.priority=78 \
  terra-extras.priority=77 \
  terra-mesa.priority=76 \
  terra-mesa-source.priority=76 \

dnf5 config-manager setopt \
  copr:copr.fedorainfracloud.org:ycollet:audinux.exclude="kernel*"