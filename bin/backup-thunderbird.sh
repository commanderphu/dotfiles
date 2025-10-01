#!/usr/bin/env bash
# Backup Thunderbird (Flatpak oder native)

set -e

# Standardpfade
BASE_NATIVE="${HOME}/.thunderbird"
BASE_FLATPAK="${HOME}/.var/app/org.mozilla.Thunderbird/.thunderbird"
DEST="${HOME}/.config/thunderbird-profile"

# Erkennen, ob Flatpak oder native
if [ -d "$BASE_FLATPAK" ]; then
  BASE="$BASE_FLATPAK"
elif [ -d "$BASE_NATIVE" ]; then
  BASE="$BASE_NATIVE"
else
  echo "❌ Kein Thunderbird-Profil gefunden. Bitte Thunderbird einmal starten."
  exit 1
fi

# Profilordner ermitteln
PROFILE=$(find "$BASE" -maxdepth 1 -type d -name "*.default-release" | head -n1)
[ -n "$PROFILE" ] || PROFILE=$(find "$BASE" -maxdepth 1 -type d -name "*.*" | head -n1)

[ -n "$PROFILE" ] || { echo "❌ Kein Profilordner gefunden."; exit 1; }

echo "🔎 Profil: $PROFILE"
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
  "$PROFILE/" "$DEST/"

echo "✅ Backup fertig."
