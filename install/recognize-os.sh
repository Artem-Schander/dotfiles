#!/bin/bash

# Enhanced OS detection for multi-platform dotfiles installation
# Supports: macOS, Ubuntu, Arch Linux (including Manjaro)
# 
# Usage when sourcing:
#   source install/recognize-os.sh           # Normal output
#   QUIET=true source install/recognize-os.sh  # Suppress output

log() {
    if [ "${QUIET:-false}" != "true" ]; then
        echo "$1"
    fi
}

detect_os() {
    if [ "$(uname)" == "Darwin" ]; then
        # macOS
        export OS=Darwin
        log "Detected: macOS"
    elif [ -f /etc/os-release ]; then
        # Modern Linux systems
        . /etc/os-release
        case "$ID" in
            ubuntu)
                export OS=Ubuntu
                log "Detected: Ubuntu Linux"
                ;;
            arch)
                export OS=Arch
                log "Detected: Arch Linux"
                ;;
            manjaro)
                export OS=Arch
                log "Detected: Manjaro Linux (Arch-based)"
                ;;
            *)
                # Try to detect Ubuntu by checking for specific files
                if [ -n "$(cat /etc/os-release 2>/dev/null | grep -i ubuntu)" ]; then
                    export OS=Ubuntu
                    log "Detected: Ubuntu-based Linux"
                else
                    log "Warning: Unsupported Linux distribution: $ID"
                    log "Supported: Ubuntu, Arch Linux, Manjaro"
                    export OS=""
                fi
                ;;
        esac
    elif [ -f "/etc/arch-release" ]; then
        # Arch Linux
        export OS=Arch
        log "Detected: Arch Linux"
    elif [ -f "/etc/artix-release" ]; then
        # Artix (Arch-based)
        export OS=Arch
        log "Detected: Artix Linux (Arch-based)"
    elif [ -n "$(lsb_release -si 2>/dev/null | grep -i ubuntu)" ]; then
        # Ubuntu via lsb_release
        export OS=Ubuntu
        log "Detected: Ubuntu Linux (via lsb_release)"
    elif [ -f "/etc/debian_version" ]; then
        # Debian-based systems (including Ubuntu)
        export OS=Ubuntu
        log "Detected: Debian-based Linux (treating as Ubuntu)"
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
        # Windows (not supported)
        log "Error: Windows is not currently supported"
        export OS=Windows
    else
        # Unknown system
        log "Error: Unable to detect operating system"
        log "Supported systems: macOS, Ubuntu, Arch Linux, Manjaro"
        export OS=""
    fi
}

# Run detection
detect_os

# Verify OS was detected
if [ -z "$OS" ] || [ "$OS" == "Windows" ]; then
    log "Installation cannot continue with unsupported or undetected OS."
    return 1 2>/dev/null || exit 1  # return if sourced, exit if executed
fi
