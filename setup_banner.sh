#!/bin/bash
# ╔══════════════════════════════════════╗
# ║   .bashrc setup — MrDevilEx          ║
# ║   Auto banner + alias install        ║
# ╚══════════════════════════════════════╝

BANNER_PATH="$HOME/.termux/banner.sh"
BASHRC="$HOME/.bashrc"

echo ""
echo -e "\033[1;32m[*] Installing MrDevilEx Banner...\033[0m"

# Copy banner script
cp banner.sh "$BANNER_PATH"
chmod +x "$BANNER_PATH"
echo -e "\033[1;32m[✓] Banner copied to $BANNER_PATH\033[0m"

# Add to .bashrc if not already there
if ! grep -q "banner.sh" "$BASHRC" 2>/dev/null; then
    echo "" >> "$BASHRC"
    echo "# MrDevilEx Banner" >> "$BASHRC"
    echo "bash $BANNER_PATH" >> "$BASHRC"
    echo -e "\033[1;32m[✓] Auto-start added to .bashrc\033[0m"
else
    echo -e "\033[1;33m[!] Already in .bashrc, skipping...\033[0m"
fi

# Add alias
if ! grep -q "alias devil=" "$BASHRC" 2>/dev/null; then
    echo "alias devil='bash $BANNER_PATH'" >> "$BASHRC"
    echo -e "\033[1;32m[✓] Alias 'devil' added\033[0m"
fi

echo ""
echo -e "\033[1;36m[✓] Done! Restart Termux অথবা এখনই দেখতে:\033[0m"
echo -e "\033[1;32m    bash $BANNER_PATH\033[0m"
echo ""
echo -e "\033[1;33m    পরে যেকোনো সময় দেখতে: devil\033[0m"
echo ""
