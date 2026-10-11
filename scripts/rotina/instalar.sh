#!/bin/bash
# Instala (ou reinstala) a rotina do blog no launchd do usuário.
set -euo pipefail
DIR="$(cd "$(dirname "$0")" && pwd)"
LABEL="br.miblify.blog-post"
DEST="$HOME/Library/LaunchAgents/$LABEL.plist"

mkdir -p "$DIR/../../.rotina"
cp "$DIR/$LABEL.plist" "$DEST"
launchctl bootout "gui/$(id -u)/$LABEL" 2>/dev/null || true
launchctl bootstrap "gui/$(id -u)" "$DEST"
echo "Rotina $LABEL instalada. Log: .rotina/rotina.log"
echo "Rodar agora: launchctl kickstart gui/$(id -u)/$LABEL"
