#!/usr/bin/env bash
# backup-thunderbird.sh — sichert relevante Thunderbird-Einstellungen ins XDG-Config,
# ohne Mails/Cache. Für Dotfiles geeignet.

set -e

DEST="${HOME}/.config/thunderbird-profile"

# 1) Profil ermitteln (bevorzugt *.default-release, sonst erstes Profil)
find_profile() {
  local base="${HOME}/.thunderbird"
  local p

  # bevorzugt default-release
  p=$(find "$base" -maxdepth 1 -type d -name "*.default-release" | head -n1)
  if [ -z "$p" ]; then
    # sonst erstes zufälliges Profil (xxxxxxxx.default oder custom)
    p=$(find "$base" -maxdepth 1 -type d -name "*.*" | grep -vE 'Crash Reports|Pending Pings' | head -n1)
  fi
  echo "$p"
}

SRC="$(find_profile)"
[ -n "$SRC" ] || { echo "❌ Kein Thunderbird-Profil gefunden. Starte Thunderbird einmal, damit ein Profil angelegt wird."; exit 1; }

echo "🔎 Profil: $SRC"
echo "📦 Ziel:   $DEST"

mkdir -p "$DEST"

# 2) Einstellungen kopieren (ohne Mail/Cache/Telemetrie)
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

# 3) kleine Info
echo "✅ Backup fertig."
echo "   Gesichert wurden u.a.: prefs.js, user.js (falls vorhanden), chrome/, extensions/ etc."
echo "   Nicht gesichert: ImapMail/, Mail/, cache2/, …"
