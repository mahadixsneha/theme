#!/bin/bash
# ╔══════════════════════════════════════╗
# ║   Termux Theme Installer             ║
# ║   Made by MrDevilEx                  ║
# ╚══════════════════════════════════════╝

THEMES=("dark-hacker" "dracula" "monokai" "cyberpunk")
THEME_NAMES=("🟢 Dark Hacker" "🟣 Dracula" "🟠 Monokai" "🔵 Cyberpunk")
TERMUX_DIR="$HOME/.termux"

echo ""
echo "╔══════════════════════════════════════╗"
echo "║     Termux Theme Installer           ║"
echo "║     Made by MrDevilEx               ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "Available themes:"
for i in "${!THEMES[@]}"; do
    echo "  [$((i+1))] ${THEME_NAMES[$i]}"
done
echo ""
read -p "Select theme [1-4]: " choice

INDEX=$((choice-1))

if [[ $INDEX -lt 0 || $INDEX -ge ${#THEMES[@]} ]]; then
    echo "❌ Invalid choice!"
    exit 1
fi

SELECTED="${THEMES[$INDEX]}"
echo ""
echo "Installing ${THEME_NAMES[$INDEX]} theme..."

mkdir -p "$TERMUX_DIR"

# Backup existing
if [ -f "$TERMUX_DIR/colors.properties" ]; then
    cp "$TERMUX_DIR/colors.properties" "$TERMUX_DIR/colors.properties.bak"
    echo "✅ Backed up existing colors.properties"
fi
if [ -f "$TERMUX_DIR/termux.properties" ]; then
    cp "$TERMUX_DIR/termux.properties" "$TERMUX_DIR/termux.properties.bak"
    echo "✅ Backed up existing termux.properties"
fi

# Install
cp "$SELECTED/colors.properties" "$TERMUX_DIR/colors.properties"
cp "$SELECTED/termux.properties" "$TERMUX_DIR/termux.properties"

echo ""
echo "✅ ${THEME_NAMES[$INDEX]} installed successfully!"
echo ""
echo "🔄 Reload Termux settings with:"
echo "   termux-reload-settings"
echo ""
echo "   — MrDevilEx"
