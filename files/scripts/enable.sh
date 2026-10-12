#!/usr/bin/env bash
set -euo pipefail

LIST=/usr/share/bluebird/extensions-enable
OUT=/etc/dconf/db/local.d/10-enabled-extensions

mapfile -t exts < <(grep -vE '^\s*(#|$)' "$LIST")
printf -v joined "'%s', " "${exts[@]}"

printf '[org/gnome/shell]\nenabled-extensions=[%s]\n' "${joined%, }" > "$OUT"

LIST=/usr/share/bluebird/blur-apps
OUT=/etc/dconf/db/local.d/20-blur-apps

mapfile -t exts < <(grep -vE '^\s*(#|$)' "$LIST")
printf -v joined "'%s', " "${exts[@]}"

printf '[org/gnome/shell/extensions/blur-my-shell/applications]\nwhitelist=[%s]\n' "${joined%, }" > "$OUT"