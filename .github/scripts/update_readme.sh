#!/bin/sh
# Regenerates the mod table in README.md from client/server/modlist.md.
# Link/category/description come from Hexium (falls back to Thunderstore)'s
# package API; overrides.json (next to this script) can override specific mods.

set -eu

need() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "error: '$1' is required but not installed" >&2
    exit 1
  }
}
need curl
need jq
need awk
need sort
need comm
need mktemp

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO_ROOT=$(CDPATH= cd -- "$SCRIPT_DIR/../.." && pwd)
README="$REPO_ROOT/README.md"
CLIENT_MODLIST="$REPO_ROOT/client/modlist.md"
SERVER_MODLIST="$REPO_ROOT/server/modlist.md"
OVERRIDES_FILE="$SCRIPT_DIR/overrides.json"
TABLE_START='<!-- mods-table:start -->'
TABLE_END='<!-- mods-table:end -->'
USER_AGENT='Chrome/153.0.0.0'

CHECK_NETWORK=1
for arg in "$@"; do
  case "$arg" in
    --no-network) CHECK_NETWORK=0 ;;
    *)
      echo "error: unknown argument: $arg" >&2
      echo "usage: $0 [--no-network]" >&2
      exit 1
      ;;
  esac
done

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT INT TERM

extract_mods() {
  awk '
    /^[[:space:]]*$/ { next }
    {
      line = $0
      if (!match(line, /-[0-9]+\.[0-9]+\.[0-9]+[[:space:]]*$/)) {
        print "warning: could not parse modlist line: " line > "/dev/stderr"
        next
      }
      rest = substr(line, 1, RSTART - 1)
      idx = index(rest, "-")
      if (idx == 0) {
        print "warning: no namespace separator in: " line > "/dev/stderr"
        next
      }
      print substr(rest, 1, idx - 1) "/" substr(rest, idx + 1)
    }
  ' | sort -u
}

if [ -f "$CLIENT_MODLIST" ]; then
  extract_mods < "$CLIENT_MODLIST" > "$TMPDIR/client.txt"
else
  : > "$TMPDIR/client.txt"
fi
if [ -f "$SERVER_MODLIST" ]; then
  extract_mods < "$SERVER_MODLIST" > "$TMPDIR/server.txt"
else
  : > "$TMPDIR/server.txt"
fi

comm -12 "$TMPDIR/client.txt" "$TMPDIR/server.txt" > "$TMPDIR/both.txt"
sort -uf "$TMPDIR/client.txt" "$TMPDIR/server.txt" > "$TMPDIR/all.txt"

is_noise_category() {
  case "$1" in
    Mods | Modpack | Client-only | Server-only | Client-side | Server-side \
      | "Client & Server" | "Client (& Server)" | "Valheim 1.0" | *Update) return 0 ;;
    *) return 1 ;;
  esac
}

fetch_package_json() {
  ns="$1"
  name="$2"
  if [ "$CHECK_NETWORK" -eq 1 ]; then
    if json=$(curl -sS -f -A "$USER_AGENT" "https://valheim.hexium.gg/api/experimental/package/$ns/$name/" 2>/dev/null); then
      printf '%s' "$json"
      return 0
    fi
    if json=$(curl -sS -f -A "$USER_AGENT" "https://thunderstore.io/api/experimental/package/$ns/$name/" 2>/dev/null); then
      printf '%s' "$json"
      return 0
    fi
  fi
  return 1
}

ROWS_FILE="$TMPDIR/rows.tsv"
: > "$ROWS_FILE"

while IFS= read -r key; do
  [ -z "$key" ] && continue
  ns=${key%%/*}
  name=${key#*/}

  if grep -qxF "$key" "$TMPDIR/both.txt"; then
    side="Both"
  elif grep -qxF "$key" "$TMPDIR/client.txt"; then
    side="Client"
  else
    side="Server"
  fi

  if json=$(fetch_package_json "$ns" "$name"); then
    link=$(printf '%s' "$json" | jq -r '.package_url // empty')
    [ -z "$link" ] && link="https://thunderstore.io/c/valheim/p/$ns/$name/"

    desc=$(printf '%s' "$json" \
      | jq -r '.latest.description // "No description available."' \
      | tr -d '\r' \
      | awk 'NF { print; exit }' \
      | sed 's/[[:space:]]*$//; s/|/\\|/g')
    [ -z "$desc" ] && desc="No description available."

    category=""
    while IFS= read -r c; do
      [ -z "$c" ] && continue
      if ! is_noise_category "$c"; then
        category="${category:+$category/}$c"
      fi
    done <<CATS
$(printf '%s' "$json" | jq -r '(.community_listings[0].categories // [])[]')
CATS
    [ -z "$category" ] && category="Misc"
  else
    echo "warning: $key not found via Hexium or Thunderstore API; using placeholders, verify manually" >&2
    link="https://thunderstore.io/c/valheim/p/$ns/$name/"
    category="Unknown"
    desc="TODO: mod not found via API, verify manually."
  fi

  if [ -f "$OVERRIDES_FILE" ]; then
    override_desc=$(jq -r --arg k "$key" '.[$k].description // empty' "$OVERRIDES_FILE")
    override_category=$(jq -r --arg k "$key" '.[$k].category // empty' "$OVERRIDES_FILE")
    [ -n "$override_desc" ] && desc=$(printf '%s' "$override_desc" | sed 's/|/\\|/g')
    [ -n "$override_category" ] && category="$override_category"
  fi

  printf '%s\t%s\t%s\t%s\n' "[$name]($link)" "$side" "$category" "$desc" >> "$ROWS_FILE"
done < "$TMPDIR/all.txt"

TABLE_MD="$TMPDIR/table.md"
awk -F'\t' -v start="$TABLE_START" -v end="$TABLE_END" '
  function pad(s, w,    r) { r = s; while (length(r) < w) r = r " "; return r }
  function dashes(w,    r) { r = ""; while (length(r) < w) r = r "-"; return r }
  BEGIN {
    h1 = "Mod"; h2 = "Side"; h3 = "Category"; h4 = "What it does"
    w1 = length(h1); w2 = length(h2); w3 = length(h3); w4 = length(h4)
  }
  {
    a1[NR] = $1; a2[NR] = $2; a3[NR] = $3; a4[NR] = $4
    if (length($1) > w1) w1 = length($1)
    if (length($2) > w2) w2 = length($2)
    if (length($3) > w3) w3 = length($3)
    if (length($4) > w4) w4 = length($4)
    n = NR
  }
  END {
    print start
    print "| " pad(h1, w1) " | " pad(h2, w2) " | " pad(h3, w3) " | " pad(h4, w4) " |"
    print "|" dashes(w1 + 2) "|" dashes(w2 + 2) "|" dashes(w3 + 2) "|" dashes(w4 + 2) "|"
    for (i = 1; i <= n; i++) {
      print "| " pad(a1[i], w1) " | " pad(a2[i], w2) " | " pad(a3[i], w3) " | " pad(a4[i], w4) " |"
    }
    print end
  }
' "$ROWS_FILE" > "$TABLE_MD"

if ! grep -qF "$TABLE_START" "$README" || ! grep -qF "$TABLE_END" "$README"; then
  echo "error: couldn't find $TABLE_START / $TABLE_END markers in $README" >&2
  exit 1
fi

awk -v tf="$TABLE_MD" -v start="$TABLE_START" -v end="$TABLE_END" '
  BEGIN {
    while ((getline line < tf) > 0) table = table line "\n"
    close(tf)
  }
  index($0, start) { printf "%s", table; skip = 1 }
  index($0, end)   { skip = 0; next }
  skip { next }
  { print }
' "$README" > "$TMPDIR/readme.new"

mv "$TMPDIR/readme.new" "$README"

n=$(wc -l < "$ROWS_FILE" | tr -d '[:space:]')
echo "Updated table with $n mods."
