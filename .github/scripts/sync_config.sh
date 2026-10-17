#!/bin/sh
# Downloads a Gale-synced profile's zip and mirrors its BepInEx/config files
# into a directory. Uses gale-sync's public GET /profile/{id} endpoint, which
# redirects to the CDN (read access needs no auth):
# https://github.com/Kesomannen/gale-sync/blob/master/docs/api.md
#
# Usage: .github/scripts/sync_config.sh <profile-id> <output-dir>

set -eu

need() {
  command -v "$1" >/dev/null 2>&1 || { echo "error: '$1' is required" >&2; exit 1; }
}
need curl
need unzip

PROFILE_ID="${1:?usage: $0 <profile-id> <output-dir>}"
OUT_DIR="${2:?usage: $0 <profile-id> <output-dir>}"
USER_AGENT='seintrheim-modpack-gale-sync/1.0'

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

curl -sS -f -L -A "$USER_AGENT" -o "$tmp/profile.zip" "https://gale.kesomannen.com/api/profile/$PROFILE_ID"

# Per-player runtime data (e.g. QuickStackStore_player_*.dat) isn't config.
unzip -q "$tmp/profile.zip" 'BepInEx/config/*' -x '*.dat' -d "$tmp/out"

if [ ! -d "$tmp/out/BepInEx/config" ]; then
  echo "error: profile $PROFILE_ID has no BepInEx/config directory" >&2
  exit 1
fi

# Mirror, so configs removed from the profile are removed here too.
rm -rf "$OUT_DIR"
mkdir -p "$(dirname "$OUT_DIR")"
mv "$tmp/out/BepInEx/config" "$OUT_DIR"

echo "Wrote $(find "$OUT_DIR" -type f | wc -l | tr -d '[:space:]') config files to $OUT_DIR"
