#!/bin/bash

VSCODE_USER="$HOME/Library/Application Support/Code/User"

mkdir -p "$VSCODE_USER"

ln -sf "$(pwd)/settings.json" "$VSCODE_USER/settings.json"
ln -sf "$(pwd)/keybindings.json" "$VSCODE_USER/keybindings.json"

echo "Done. VSCode settings and keybindings symlinked."
