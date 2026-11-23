#!/usr/bin/env bash

COMPONENT_NAME="$1"

escape_line() {
    local line="$1"
    line="${line//\\/\\\\}"
    line="${line//\"/\\\"}"
    echo "$line"
}

echo "    \"${COMPONENT_NAME}\": Split("
echo "        direction: Vertical,"
echo "        panes: ["

while IFS='' read -r line || [[ -n "$line" ]]; do
    esc=$(escape_line "$line")
    echo "            ( size: \"1\", pane: Pane(Property(content: [(kind: Text(\"$esc\"))])) ),"
done

echo "        ],"
echo "    ),"
