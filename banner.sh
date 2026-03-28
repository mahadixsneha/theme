#!/bin/bash
# ╔══════════════════════════════════════╗
# ║   MrDevilEx | Hacker Banner          ║
# ║   Termux Startup Animation           ║
# ╚══════════════════════════════════════╝

# Colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
BGREEN='\033[1;32m'
BRED='\033[1;31m'
BCYAN='\033[1;36m'
BWHITE='\033[1;37m'
BYELLOW='\033[1;33m'
RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'

# Get terminal width
COLS=$(tput cols 2>/dev/null || echo 60)

# ─────────────────────────────────────────
# Function: center text
# ─────────────────────────────────────────
center() {
    local text="$1"
    local clean=$(echo -e "$text" | sed 's/\x1b\[[0-9;]*m//g')
    local len=${#clean}
    local pad=$(( (COLS - len) / 2 ))
    printf "%${pad}s" ""
    echo -e "$text"
}

# ─────────────────────────────────────────
# Function: Matrix Rain
# ─────────────────────────────────────────
matrix_rain() {
    local chars="01アイウエオカキクケコサシスセソタチツテトナニヌネノ"
    local duration=18
    echo ""
    for i in $(seq 1 $duration); do
        local line=""
        for j in $(seq 1 $((COLS / 2))); do
            local r=$((RANDOM % ${#chars}))
            local c="${chars:$r:1}"
            if [ $((RANDOM % 3)) -eq 0 ]; then
                line+="${BGREEN}${c}${RESET}"
            elif [ $((RANDOM % 5)) -eq 0 ]; then
                line+="${GREEN}${c}${RESET}"
            else
                line+="${DIM}${GREEN}${c}${RESET}"
            fi
        done
        echo -e "$line"
        sleep 0.04
    done
}

# ─────────────────────────────────────────
# Function: Glitch Effect on text
# ─────────────────────────────────────────
glitch_text() {
    local text="$1"
    local glitch_chars="@#\$%&*!?/<>[]{}|~^"
    local iterations=6
    for i in $(seq 1 $iterations); do
        local glitched=""
        for (( k=0; k<${#text}; k++ )); do
            if [ $((RANDOM % 4)) -eq 0 ]; then
                local r=$((RANDOM % ${#glitch_chars}))
                glitched+="${BRED}${glitch_chars:$r:1}${RESET}"
            else
                glitched+="${BGREEN}${text:$k:1}${RESET}"
            fi
        done
        printf "\r"
        center "$glitched"
        sleep 0.07
        printf "\033[1A"
    done
    printf "\r"
    center "${BGREEN}${text}${RESET}"
    echo ""
}

# ─────────────────────────────────────────
# Function: Typewriter Effect
# ─────────────────────────────────────────
typewriter() {
    local text="$1"
    local color="${2:-$BGREEN}"
    local delay="${3:-0.05}"
    local pad=$(( (COLS - ${#text}) / 2 ))
    printf "%${pad}s" ""
    for (( i=0; i<${#text}; i++ )); do
        printf "${color}${text:$i:1}${RESET}"
        sleep $delay
    done
    echo ""
}

# ─────────────────────────────────────────
# Function: Progress Bar
# ─────────────────────────────────────────
progress_bar() {
    local label="$1"
    local total=30
    local pad=$(( (COLS - total - ${#label} - 5) / 2 ))
    printf "%${pad}s" ""
    printf "${CYAN}${label} [${RESET}"
    for i in $(seq 1 $total); do
        printf "${BGREEN}█${RESET}"
        sleep 0.03
    done
    printf "${CYAN}] ${BGREEN}OK${RESET}\n"
}

# ─────────────────────────────────────────
# Function: Divider line
# ─────────────────────────────────────────
divider() {
    local char="${1:-─}"
    local color="${2:-$DIM$GREEN}"
    local line=""
    for i in $(seq 1 $COLS); do line+="$char"; done
    echo -e "${color}${line}${RESET}"
}

# ─────────────────────────────────────────
# ASCII ART LOGO
# ─────────────────────────────────────────
show_logo() {
    echo ""
    center "${DIM}${GREEN}╔══════════════════════════════════════════════════════╗${RESET}"
    center "${DIM}${GREEN}║${RESET}                                                      ${DIM}${GREEN}║${RESET}"
    center "${DIM}${GREEN}║${RESET}  ${BGREEN} ███╗   ███╗██████╗ ██████╗ ███████╗██╗   ██╗${RESET}  ${DIM}${GREEN}║${RESET}"
    center "${DIM}${GREEN}║${RESET}  ${BGREEN} ████╗ ████║██╔══██╗██╔══██╗██╔════╝██║   ██║${RESET}  ${DIM}${GREEN}║${RESET}"
    center "${DIM}${GREEN}║${RESET}  ${BGREEN} ██╔████╔██║██████╔╝██║  ██║█████╗  ██║   ██║${RESET}  ${DIM}${GREEN}║${RESET}"
    center "${DIM}${GREEN}║${RESET}  ${BGREEN} ██║╚██╔╝██║██╔══██╗██║  ██║██╔══╝  ╚██╗ ██╔╝${RESET}  ${DIM}${GREEN}║${RESET}"
    center "${DIM}${GREEN}║${RESET}  ${BGREEN} ██║ ╚═╝ ██║██║  ██║██████╔╝███████╗ ╚████╔╝ ${RESET}  ${DIM}${GREEN}║${RESET}"
    center "${DIM}${GREEN}║${RESET}  ${BGREEN} ╚═╝     ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝  ╚═══╝  ${RESET}  ${DIM}${GREEN}║${RESET}"
    center "${DIM}${GREEN}║${RESET}                                                      ${DIM}${GREEN}║${RESET}"
    center "${DIM}${GREEN}╚══════════════════════════════════════════════════════╝${RESET}"
    echo ""
}

# ─────────────────────────────────────────
# MAIN ANIMATION SEQUENCE
# ─────────────────────────────────────────
clear

# 1. Matrix Rain
matrix_rain

clear

# 2. Logo with glitch
show_logo
sleep 0.3

# 3. Glitch title
glitch_text "MrDevilEx | Hacker"
sleep 0.2

# 4. Typewriter subtitle
typewriter "[ Unauthorized Access Will Be Prosecuted ]" "$BRED" 0.04
sleep 0.2

divider "─" "$DIM$GREEN"
echo ""

# 5. System info typewriter
typewriter "» Initializing secure shell..." "$CYAN" 0.04
sleep 0.1
typewriter "» Loading modules..." "$CYAN" 0.03
sleep 0.1

echo ""
progress_bar "SYSTEM  "
progress_bar "NETWORK "
progress_bar "MODULES "
echo ""

divider "═" "$DIM$GREEN"
echo ""

# 6. Final brand line
center "${BYELLOW}⚡ ${BGREEN}MrDevilEx${RESET} ${WHITE}|${RESET} ${BCYAN}Hacker Terminal${RESET} ${BYELLOW}⚡${RESET}"
echo ""
center "${DIM}${GREEN}\"Code is the weapon. Terminal is the battlefield.\"${RESET}"
echo ""
divider "─" "$DIM$GREEN"

# 7. Date/time
center "${DIM}${GREEN}$(date '+%A, %d %B %Y  |  %H:%M:%S')${RESET}"
echo ""
