# 🎨 Termux Theme Pack — by MrDevilEx

৪টি premium Termux theme একসাথে!

## Themes

| Theme | Style | Background | Accent |
|-------|-------|-----------|--------|
| 🟢 Dark Hacker | Matrix/Hacker | #0D0D0D | #00FF41 |
| 🟣 Dracula | Purple/Dark | #282A36 | #BD93F9 |
| 🟠 Monokai | Warm/Retro | #272822 | #F92672 |
| 🔵 Cyberpunk | Neon/Futuristic | #0A0A0F | #FF003C |

---

## ইনস্টল করার উপায়

### পদ্ধতি ১ — Installer script (সহজ)

```bash
chmod +x install.sh
bash install.sh
```
Theme বেছে নাও, তারপর:
```bash
termux-reload-settings
```

---

### পদ্ধতি ২ — Manual install

```bash
mkdir -p ~/.termux

# উদাহরণ: Dracula theme
cp dracula/colors.properties ~/.termux/colors.properties
cp dracula/termux.properties ~/.termux/termux.properties

termux-reload-settings
```

---

### পদ্ধতি ৩ — One-liner (যেকোনো theme)

```bash
# Dark Hacker
cp dark-hacker/colors.properties ~/.termux/ && cp dark-hacker/termux.properties ~/.termux/ && termux-reload-settings

# Dracula
cp dracula/colors.properties ~/.termux/ && cp dracula/termux.properties ~/.termux/ && termux-reload-settings

# Monokai
cp monokai/colors.properties ~/.termux/ && cp monokai/termux.properties ~/.termux/ && termux-reload-settings

# Cyberpunk
cp cyberpunk/colors.properties ~/.termux/ && cp cyberpunk/termux.properties ~/.termux/ && termux-reload-settings
```

---

## Backup restore

```bash
# Previous theme restore করতে
cp ~/.termux/colors.properties.bak ~/.termux/colors.properties
cp ~/.termux/termux.properties.bak ~/.termux/termux.properties
termux-reload-settings
```

---

Made with ❤️ by **MrDevilEx**
