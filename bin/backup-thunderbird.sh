#!/usr/bin/env bash
set -euo pipefail

BASE_NATIVE="$HOME/.thunderbird"
BASE_FLAT="$HOME/.var/app/org.mozilla.Thunderbird/.thunderbird"
DEST="$HOME/.config/thunderbird-profile"

# Thunderbird beenden (native + flatpak)
pkill -x thunderbird 2>/dev/null || true
flatpak kill org.mozilla.Thunderbird 2>/dev/null || true

# Profilbasis wählen
if [ -d "$BASE_FLAT" ]; then BASE="$BASE_FLAT"
elif [ -d "$BASE_NATIVE" ]; then BASE="$BASE_NATIVE"
else echo "❌ Kein Profilordner. Starte TB einmal."; exit 1; fi

# Default-Profil aus profiles.ini
if [ -f "$BASE/profiles.ini" ]; then
  rel=$(awk -F= '
    /^\[Profile/ {d=0}
    /^Default=1/ {d=1}
    /^Path=/ && d==1 {print $2; exit}
  ' "$BASE/profiles.ini")
  if [ -n "$rel" ]; then
    if grep -q '^IsRelative=1' "$BASE/profiles.ini"; then SRC="$BASE/$rel"; else SRC="$rel"; fi
  fi
fi

# Fallbacks
[ -z "${SRC:-}" ] && SRC=$(find "$BASE" -maxdepth 1 -type d -name "*.default-release" | head -n1)
[ -z "${SRC:-}" ] && SRC=$(find "$BASE" -maxdepth 1 -type d -name "*.*" | grep -vE 'Crash Reports|Pending Pings' | head -n1)
[ -n "${SRC:-}" ] || { echo "❌ Kein Profilordner gefunden."; exit 1; }

echo "🔎 Quelle: $SRC"
echo "📦 Ziel:   $DEST"
mkdir -p "$DEST"

rsync -a --delete \
  --exclude 'ImapMail' \
  --exclude 'Mail' \
  --exclude 'cache2' \
  --exclude 'thumbnails' \
  --exclude 'minidumps' \
  --exclude 'datareporting' \
  --exclude 'startupCache' \
  --exclude 'Calendar' \
  --exclude 'OfflineCache' \
  --exclude 'storage.sdb' \
  --exclude 'global-messages-db.sqlite' \
  --exclude 'times.json' \
  "$SRC/" "$DEST/"

echo "✅ Backup ok → $DEST"
