#!/usr/bin/env bash
# Keeps a rolling window of pinned rollback deployments, so more than one
# rollback point stays available after each update.
set -euo pipefail

STATE_FILE="/var/lib/bluebird/pinned-deployments"
KEEP=3  # number of rolling rollback points, on top of deployments 0 and 1

install -d -m 0755 "$(dirname "$STATE_FILE")"
touch "$STATE_FILE"

STATUS_JSON="$(rpm-ostree status --json)"
ROLLBACK_CHECKSUM="$(jq -r '.deployments[1].checksum // empty' <<< "$STATUS_JSON")"

if [[ -z "$ROLLBACK_CHECKSUM" ]]; then
    echo "No rollback deployment found. Nothing to pin."
    exit 0
fi

if ! grep -qx "$ROLLBACK_CHECKSUM" "$STATE_FILE"; then
    ostree admin pin rollback
    echo "$ROLLBACK_CHECKSUM" >> "$STATE_FILE"
    logger -t bluebird-pin-rotate "Pinned deployment $ROLLBACK_CHECKSUM"
fi

# Trim the rolling window. Unpin the oldest tracked deployment first.
while [[ "$(wc -l < "$STATE_FILE")" -gt "$KEEP" ]]; do
    OLD_CHECKSUM="$(head -n 1 "$STATE_FILE")"
    OLD_INDEX="$(jq -r --arg c "$OLD_CHECKSUM" \
        '.deployments | to_entries[] | select(.value.checksum == $c) | .key' \
        <<< "$(rpm-ostree status --json)")"

    if [[ -n "$OLD_INDEX" ]]; then
        ostree admin pin --unpin "$OLD_INDEX"
        logger -t bluebird-pin-rotate "Unpinned deployment $OLD_CHECKSUM"
    fi

    tail -n +2 "$STATE_FILE" > "$STATE_FILE.tmp"
    mv "$STATE_FILE.tmp" "$STATE_FILE"
done