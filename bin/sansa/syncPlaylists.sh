#!/usr/bin/env bash
set -euo pipefail

SRC_OK="$HOME/Playlists"
SRC_SANSA="$HOME/sansa/Playlists"

# ⬅️ Merge IMMER zuerst nach /tmp
MERGED="$(mktemp -d /tmp/Playlists_merged.XXXXXX)"

BACKUP_BASE="$HOME/.local/share/scrobbler"
TS="$(date '+%F_%H:%M:%S')"
BACKUP_DIR="$BACKUP_BASE/Playlist_${TS}.old"

mkdir -p "$BACKUP_DIR"

mkdir -p "$BACKUP_DIR/Playlists" "$BACKUP_DIR/sansa_Playlists"

cp -a "$SRC_OK"    "$BACKUP_DIR/Playlists"
cp -a "$SRC_SANSA" "$BACKUP_DIR/sansa_Playlists"

clean_file() {
  sed \
    -e '1s/^\xEF\xBB\xBF//' \
    -e 's|/<microSD1>|..|g' \
    "$1"
}

for pl in "$SRC_OK"/*.m3u*; do
  name=$(basename "$pl")
  sansa_pl="$SRC_SANSA/$name"

  if [[ -f "$sansa_pl" ]]; then
    {
      clean_file "$pl"
      clean_file "$sansa_pl"
    } | awk '
      /^#/ { meta=$0; next }
      {
        key=$0
        sub(/\.(mp3|flac|ogg|opus|wav)$/,"",key)
        if (!seen[key]++) {
          if (meta) print meta
          print
        }
        meta=""
      }
    ' > "$MERGED/$name"
  else
    clean_file "$pl" > "$MERGED/$name"
  fi
done

# ✅ ERST JETZT: ersetzen
rsync -rth --delete "$MERGED/" "$SRC_OK/"
rsync -rth --delete "$MERGED/" "$SRC_SANSA/"
