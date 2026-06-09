#!/usr/bin/env bash
# rmpc-preview-song.sh: Find and display cover art for an Artist - Song - Album triple

printf "\033_Ga=d,d=A\033\\"
MUSIC_DIR="${MUSIC_DIR:-$HOME/Music}"
INPUT="$1"
RELATIVE_FILE="$2"
SOCKET=~/.config/mpd/socket

if [ -z "$INPUT" ]; then
    exit 0
fi

if [ -z "$RELATIVE_FILE" ]; then
    # Strip ANSI escapes if any
    INPUT_CLEAN=$(echo "$INPUT" | sed 's/\x1b\[[0-9;]*m//g')

    # Extrahiere Artist, Title, Album aus '[Artist] Title (Album: Albumname)'
    ARTIST=$(echo "$INPUT_CLEAN" | sed -n 's/^\[\([^]]*\)\].*$/\1/p')
    TITLE=$(echo "$INPUT_CLEAN" | sed -n 's/^\[[^]]*\] \(.*\) (Album: .*)$/\1/p')
    ALBUM=$(echo "$INPUT_CLEAN" | sed -n 's/.*(Album: \(.*\))$/\1/p')

    # Fallbacks
    [ -z "$ARTIST" ] && ARTIST="Unknown Artist"
    [ -z "$ALBUM" ] && ALBUM="Unknown Album"
    [ -z "$TITLE" ] && TITLE="Unknown Title"

    # Escape quotes
    ESCAPED_ARTIST=$(echo "$ARTIST" | sed 's/"/\\"/g')
    ESCAPED_ALBUM=$(echo "$ALBUM" | sed 's/"/\\"/g')
    ESCAPED_TITLE=$(echo "$TITLE" | sed 's/"/\\"/g')

    # Query file in mpd DB
    RELATIVE_FILE=$(echo "find artist \"$ESCAPED_ARTIST\" album \"$ESCAPED_ALBUM\" title \"$ESCAPED_TITLE\" window 0:1" | socat - $SOCKET | awk -F': ' '/^file: / {print $2; exit}')
fi

if [ -z "$RELATIVE_FILE" ]; then
    echo "No files found for Artist: $ARTIST, Album: $ALBUM, Title: $TITLE"
    exit 0
fi

ALBUM_DIR="$MUSIC_DIR/$(dirname "$RELATIVE_FILE")"

# Possible cover names in priority order
COVER=""
for name in "cover.jpg" "cover.png" "cover.webp" "folder.jpg" "folder.png"; do
    if [ -f "$ALBUM_DIR/$name" ]; then
        COVER="$ALBUM_DIR/$name"
        break
    fi
done

# Fallback: Extract embedded art if no file found
TEMP_COVER="/tmp/rmpc_preview_embedded.jpg"
if [ -z "$COVER" ]; then
    if [ -n "$RELATIVE_FILE" ]; then
        ffmpeg -i "$MUSIC_DIR/$RELATIVE_FILE" -an -vcodec copy "$TEMP_COVER" -y -loglevel quiet
        if [ -s "$TEMP_COVER" ]; then
            COVER="$TEMP_COVER"
        fi
    fi
fi

if [ -n "$COVER" ]; then
    printf "\n\n"
    chafa --probe off --format sixels --animate no --align mid,mid --size "${FZF_PREVIEW_COLUMNS}x$((FZF_PREVIEW_LINES - 3))" "$COVER"
    [ "$COVER" = "$TEMP_COVER" ] && rm -f "$TEMP_COVER"
else
    echo "No cover art found (file or embedded) in:"
    echo "$ALBUM_DIR"
fi
