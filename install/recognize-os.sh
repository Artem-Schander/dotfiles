#!/bin/bash

# Enhanced OS detection for multi-platform dotfiles installation
# Supports: macOS, Ubuntu, Arch Linux (including Manjaro)

detect_os() {
    if [ "$(uname)" == "Darwin" ]; then
        # macOS
        export OS=Darwin
        echo "Detected: macOS"
    elif [ -f /etc/os-release ]; then
        # Modern Linux systems
        . /etc/os-release
        case "$ID" in
            ubuntu)
                export OS=Ubuntu
                echo "Detected: Ubuntu Linux"
                ;;
            arch)
                export OS=Arch
                echo "Detected: Arch Linux"
                ;;
            manjaro)
                export OS=Arch
                echo "Detected: Manjaro Linux (Arch-based)"
                ;;
            *)
                # Try to detect Ubuntu by checking for specific files
                if [ -n "$(cat /etc/os-release 2>/dev/null | grep -i ubuntu)" ]; then
                    export OS=Ubuntu
                    echo "Detected: Ubuntu-based Linux"
                else
                    echo "Warning: Unsupported Linux distribution: $ID"
                    echo "Supported: Ubuntu, Arch Linux, Manjaro"
                    export OS=""
                fi
                ;;
        esac
    elif [ -f "/etc/arch-release" ]; then
        # Arch Linux
        export OS=Arch
        echo "Detected: Arch Linux"
    elif [ -f "/etc/artix-release" ]; then
        # Artix (Arch-based)
        export OS=Arch
        echo "Detected: Artix Linux (Arch-based)"
    elif [ -n "$(lsb_release -si 2>/dev/null | grep -i ubuntu)" ]; then
        # Ubuntu via lsb_release
        export OS=Ubuntu
        echo "Detected: Ubuntu Linux (via lsb_release)"
    elif [ -f "/etc/debian_version" ]; then
        # Debian-based systems (including Ubuntu)
        export OS=Ubuntu
        echo "Detected: Debian-based Linux (treating as Ubuntu)"
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
        # Windows (not supported)
        echo "Error: Windows is not currently supported"
        export OS=Windows
    else
        # Unknown system
        echo "Error: Unable to detect operating system"
        echo "Supported systems: macOS, Ubuntu, Arch Linux, Manjaro"
        export OS=""
    fi
}

# Run detection
detect_os

# Verify OS was detected
if [ -z "$OS" ] || [ "$OS" == "Windows" ]; then
    echo "Installation cannot continue with unsupported or undetected OS."
    exit 1
fi
