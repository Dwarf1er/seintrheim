#!/bin/sh
# Fetches a Gale-synced profile's manifest and writes it out as a Gale-style
# "Namespace-Name-Version" modlist.md (same format as Gale's own export).
# Uses gale-sync's public GET /profile/{id}/meta endpoint (read access needs
# no auth): https://github.com/Kesomannen/gale-sync/blob/master/docs/api.md
#
# Usage: .github/scripts/sync_modlist.sh <profile-id> <output-path>

set -eu

need() {
  command -v "$1" >/dev/null 2>&1 || { echo "error: '$1' is required" >&2; exit 1; }
}
need curl
need jq

PROFILE_ID="${1:?usage: $0 <profile-id> <output-path>}"
OUT_PATH="${2:?usage: $0 <profile-id> <output-path>}"
USER_AGENT='seintrheim-modpack-gale-sync/1.0'

json=$(curl -sS -f -A "$USER_AGENT" "https://gale.kesomannen.com/api/profile/$PROFILE_ID/meta")

community=$(printf '%s' "$json" | jq -r '.manifest.community')
if [ "$community" != "valheim" ]; then
  echo "warning: profile $PROFILE_ID's community is '$community', expected 'valheim' - wrong profile ID?" >&2
fi

printf '%s' "$json" \
  | jq -r '.manifest.mods[] | select(.enabled) | "\(.name)-\(.version.major).\(.version.minor).\(.version.patch)"' \
  | sort > "$OUT_PATH"

echo "Wrote $(wc -l < "$OUT_PATH" | tr -d '[:space:]') mods to $OUT_PATH"
