#!/usr/bin/env bash
# restore-thunderbird.sh — stellt TB-Einstellungen aus ~/.config/thunderbird-profile ins aktive Profil wieder her.

set -e

SRC="${HOME}/.config/thunderbird-profile"

# 1) Ziel-Profil ermitteln
find_profile_dest() {
  local base="${HOME}/.thunderbird"
  local p

  p=$(find "$base" -maxdepth 1 -type d -name "*.default-release" | head -n1)
  if [ -z "$p" ]; then
    p=$(find "$base" -maxdepth 1 -type d -name "*.*" | grep -vE 'Crash Reports|Pending Pings' | head -n1)
  fi
  echo "$p"
}

[ -d "$SRC" ] || { echo "❌ Quelle $SRC existiert nicht. Erst Backup ausführen."; exit 1; }

DEST="$(find_profile_dest)"
[ -n "$DEST" ] || { echo "❌ Kein Thunderbird-Profil gefunden. Starte Thunderbird einmal, damit ein Profil angelegt wird."; exit 1; }

echo "🔁 Wiederherstellung:"
echo "   Quelle: $SRC"
echo "   Ziel:   $DEST"

# 2) Kopieren (wir überschreiben nur Einstellungen)
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
  "$SRC/" "$DEST/"

echo "✅ Restore fertig. Thunderbird beim nächsten Start nutzt deine Einstellungen."
