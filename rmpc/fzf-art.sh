#!/usr/bin/env bash
# rmpc-fzf-song.sh: Multi-select Artist - Song search with Cover Art preview

SOCKET=~/.config/mpd/socket

# 1. Get pairs of [Artist] Title for all songs in the database
DATA=$(echo "list title group album group artist" | socat - $SOCKET | awk -F': ' '
    /^Artist: / { artist=substr($0, index($0,$2)) }
    /^Album: /  { album=substr($0, index($0,$2)) }
    /^Title: / {
        title=substr($0, index($0,$2))
        if (title != "") {
            a = (artist != "" ? artist : "Unknown Artist")
            alb = (album != "" ? album : "Unknown Album")
            print "\033[38;2;23;193;130m[" a "]\033[0m " title " \033[38;2;83;183;221m(Album: " alb ")\033[0m"
        }
    }
' | awk 'NR>1')

# 2. Multi-select with fzf (-m flag)
SELECTED_LINES=$(echo "$DATA" | fzf -m --ansi --reverse --border=none --no-scrollbar --no-separator \
    --prompt="Fuzzy Search > " \
    --preview '$HOME/.config/rmpc/preview-fzf.sh {}' \
    --preview-window 'right:40%:border-left')
    #--header="Songs (Tab: Select | Enter: Add)" \

if [ -n "$SELECTED_LINES" ]; then
    # Check if we are currently stopped
    STATE=$(echo "status" | socat - $SOCKET | grep "^state: " | awk '{print $2}')

    # 3. Loop through each selected line
    while IFS= read -r SELECTED; do
        [ -z "$SELECTED" ] && continue

        # Strip ANSI codes
        SELECTED_CLEAN=$(echo "$SELECTED" | sed 's/\x1b\[[0-9;]*m//g')
        ARTIST=$(echo "$SELECTED_CLEAN" | sed 's/^\[\([^]]*\)\].*/\1/')
        TITLE=$(echo "$SELECTED_CLEAN" | sed 's/^\[[^]]*\] //')
        TITLE=$(echo "$TITLE" | sed 's/ (Album: .*//')

        ESCAPED_ARTIST=$(echo "$ARTIST" | sed 's/"/\\"/g')
        ESCAPED_TITLE=$(echo "$TITLE" | sed 's/"/\\"/g')

        # Add the song to the queue
        echo "findadd artist \"$ESCAPED_ARTIST\" title \"$ESCAPED_TITLE\"" > ron
        echo "findadd artist \"$ESCAPED_ARTIST\" title \"$ESCAPED_TITLE\"" | socat - $SOCKET > /dev/null
    done <<< "$SELECTED_LINES"

    # 4. If nothing was playing, start playback
    if [ "$STATE" == "stop" ]; then
        echo "play" | socat - $SOCKET > /dev/null
    fi
    echo "close" | socat - $SOCKET > /dev/null
fi
