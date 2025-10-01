#!/usr/bin/env bash
# Restore Thunderbird (Flatpak oder native)

set -e

BASE_NATIVE="${HOME}/.thunderbird"
BASE_FLATPAK="${HOME}/.var/app/org.mozilla.Thunderbird/.thunderbird"
SRC="${HOME}/.config/thunderbird-profile"

if [ -d "$BASE_FLATPAK" ]; then
  BASE="$BASE_FLATPAK"
elif [ -d "$BASE_NATIVE" ]; then
  BASE="$BASE_NATIVE"
else
  echo "❌ Kein Thunderbird-Profil gefunden. Bitte Thunderbird einmal starten."
  exit 1
fi

[ -d "$SRC" ] || { echo "❌ Quelle $SRC existiert nicht."; exit 1; }

PROFILE=$(find "$BASE" -maxdepth 1 -type d -name "*.default-release" | head -n1)
[ -n "$PROFILE" ] || PROFILE=$(find "$BASE" -maxdepth 1 -type d -name "*.*" | head -n1)

[ -n "$PROFILE" ] || { echo "❌ Kein Profilordner gefunden."; exit 1; }

echo "🔁 Wiederherstellung:"
echo "   Quelle: $SRC"
echo "   Ziel:   $PROFILE"

rsync -a \
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
  "$SRC/" "$PROFILE/"

echo "✅ Restore fertig."
