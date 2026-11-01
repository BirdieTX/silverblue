#!/usr/bin/env bash

set -oue pipefail

dnf5 upgrade --allow-vendor-change --refresh -y
plymouth-set-default-theme bgrt-mac-style