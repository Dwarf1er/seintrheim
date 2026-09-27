#!/bin/sh
# Prepends a short changelog entry for whatever changed in client/server
# modlist.md, based on git's diff against HEAD. No-ops if nothing changed.
# Meant to run after sync_modlist.sh and before committing.

set -eu

need() { command -v "$1" >/dev/null 2>&1 || { echo "error: '$1' is required" >&2; exit 1; }; }
need git
need comm
need sort
need mktemp

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/../.." && pwd)
cd "$REPO_ROOT"

CHANGELOG="CHANGELOG.md"
CLIENT_MODLIST="client/modlist.md"
SERVER_MODLIST="server/modlist.md"
MARKER='<!-- changelog:start -->'

if git diff --quiet -- "$CLIENT_MODLIST" "$SERVER_MODLIST"; then
  echo "No modlist changes, skipping changelog entry."
  exit 0
fi

if ! grep -qF "$MARKER" "$CHANGELOG"; then
  echo "error: couldn't find $MARKER in $CHANGELOG" >&2
  exit 1
fi

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT INT TERM

entry_for() {
  label="$1"
  file="$2"

  git show "HEAD:$file" > "$TMPDIR/old.txt" 2>/dev/null || : > "$TMPDIR/old.txt"
  sort -o "$TMPDIR/old.txt" "$TMPDIR/old.txt"
  sort "$file" > "$TMPDIR/new.txt"

  added=$(comm -13 "$TMPDIR/old.txt" "$TMPDIR/new.txt")
  removed=$(comm -23 "$TMPDIR/old.txt" "$TMPDIR/new.txt")

  [ -z "$added" ] && [ -z "$removed" ] && return 0

  echo "### $label"
  echo
  if [ -n "$added" ]; then
    printf '%s\n' "$added" | sed 's/^/- Added `/; s/$/`/'
  fi
  if [ -n "$removed" ]; then
    printf '%s\n' "$removed" | sed 's/^/- Removed `/; s/$/`/'
  fi
  echo
}

body=$(
  entry_for "Client" "$CLIENT_MODLIST"
  entry_for "Server" "$SERVER_MODLIST"
)

if [ -z "$body" ]; then
  echo "Modlists changed but no added/removed lines detected, skipping changelog entry."
  exit 0
fi

{
  echo "## $(date -u +%Y-%m-%d)"
  echo
  printf '%s\n' "$body"
} > "$TMPDIR/entry.md"

awk -v entry_file="$TMPDIR/entry.md" -v marker="$MARKER" '
  BEGIN {
    while ((getline line < entry_file) > 0) entry = entry line "\n"
    close(entry_file)
  }
  { print }
  index($0, marker) { printf "%s", entry }
' "$CHANGELOG" > "$TMPDIR/changelog.new"

mv "$TMPDIR/changelog.new" "$CHANGELOG"
echo "Added a changelog entry."
