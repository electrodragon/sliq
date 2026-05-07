#!/usr/bin/env bash

set -e

REPO_URL="https://raw.githubusercontent.com/electrodragon/sliq/main/sliq"
TMP_DIR="/tmp/sliq_install"
TARGET="/usr/bin/sliq"

mkdir -p "$TMP_DIR"

echo "[INFO] Downloading Sliq..."

curl -L "$REPO_URL" -o "$TMP_DIR/sliq"

chmod +x "$TMP_DIR/sliq"

if which sliq >/dev/null 2>&1; then

    echo
    echo "[WARNING] Existing 'sliq' installation detected."
    echo

    read -p "Overwrite existing installation? (y/N): " confirm

    if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
        echo "[INFO] Installation cancelled."
        exit 0
    fi
fi

echo
echo "[INFO] Installing to /usr/bin/sliq"

sudo mv "$TMP_DIR/sliq" "$TARGET"

chmod +x "$TARGET"

echo
echo "[SUCCESS] Sliq installed successfully!"
echo
echo "Usage:"
echo "  sliq"
echo "  sliq ."
echo "  sliq ~/Pictures/slides"
