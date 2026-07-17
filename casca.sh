#!/bin/bash

echo -e "🔍 \033[1;34mDetecting Linux Distribution architecture...\033[0m"

# 1. OS Detection and System Update
if [ -f /etc/arch-release ]; then
    echo -e "🦅 \033[1;36mArch Linux detected. Launching system upgrade...\033[0m"
    sudo pacman -Syu --noconfirm
    
    echo -e "\n🔍 Checking for AUR helper (yay)..."
    if command -v yay &> /dev/null; then
        echo -e "🚀 \033[1;32myay detected! Upgrading AUR packages...\033[0m"
        yay -Sua --noconfirm
    else
        echo -e "⚠️ \033[1;33mCurrently the script only supports yay as an AUR helper. Skipping AUR updates.\033[0m"
    fi
    OS_TYPE="arch"
    
elif [ -f /etc/fedora-release ] || [ -f /etc/nobara-release ]; then
    echo -e "🎩 \033[1;36mFedora/Nobara variant detected. Launching upgrade...\033[0m"
    sudo dnf upgrade --refresh -y
    OS_TYPE="fedora"
    
elif [ -f /etc/debian_version ]; then
    echo -e "🌀 \033[1;36mDebian/Ubuntu variant detected. Launching upgrade...\033[0m"
    sudo apt-get update && sudo apt-get dist-upgrade -y
    OS_TYPE="debian"
else
    echo -e "❌ \033[1;31mUnsupported OS distribution pipeline. Skipping core updates.\033[0m"
    OS_TYPE="unknown"
fi

# 2. Snap Package Checks
if command -v snap &> /dev/null; then
    echo -e "\n⚡ \033[1;34mSnap environment found. Upgrading snap packages...\033[0m"
    sudo snap refresh
    echo -e "✅ \033[1;32mSnap packages updated successfully.\033[0m"
fi

# 3. Flatpak Package Checks
if command -v flatpak &> /dev/null; then
    echo -e "\n📦 \033[1;34mFlatpak environment found. Upgrading flatpak apps...\033[0m"
    flatpak update -y
    echo -e "✅ \033[1;32mFlatpak apps updated successfully.\033[0m"
fi

# 4. Orphan Cleanup Prompt
echo -e "\n🧹 \033[1;35mCore upgrade tasks finished.\033[0m"
read -p "❓ Do you want to sweep away and remove orphaned packages? (y/N): " clean_choice
if [[ "$clean_choice" =~ ^[Yy]$ ]]; then
    echo -e "🧼 \033[1;33mPurging orphaned dependencies from the system...\033[0m"
    case "$OS_TYPE" in
        "arch")
            if [ -n "$(pacman -Qtdq)" ]; then
                sudo pacman -Rns $(pacman -Qtdq) --noconfirm
            else
                echo -e "✨ No orphans found to remove."
            fi
            ;;
        "fedora")
            sudo dnf autoremove -y
            ;;
        "debian")
            sudo apt-get autoremove -y
            ;;
        *)
            echo -e "⚠️ Skipping cleanup: Unknown package manager architecture."
            ;;
    esac
    echo -e "✅ \033[1;32mOrphan cleanup complete.\033[0m"
else
    echo -e "⏭️ Skipping orphan cleanup phase."
fi

echo -e "\n⚔️ \033[1;32mAll operational phases finished successfully!\033[0m"
