#!/bin/bash

echo -e "\n\n${GREEN}Installing development tools${NORMAL}"
echo "==============================${NORMAL}"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

QUIET=true source $HOME/.dotfiles/install/recognize-os.sh

# Platform-specific development tool installation
if [ "$OS" == "Darwin" ]; then
    echo "Installing macOS development tools..."
    
    # Install Xcode command line tools if not present
    if ! command_exists git; then
        echo "Installing Xcode command line tools..."
        xcode-select --install
    fi
    
    # Additional development tools via Homebrew
    if command_exists brew; then
        dev_tools=(
            docker
            docker-compose
            postgresql
            mysql
            redis
        )
        
        for tool in "${dev_tools[@]}"; do
            if ! brew list "$tool" >/dev/null 2>&1; then
                echo "Installing $tool..."
                brew install "$tool" || echo "Warning: Failed to install $tool"
            else
                echo "$tool already installed, skipping..."
            fi
        done
    fi
    
elif [ "$OS" == "Ubuntu" ]; then
    echo "Installing Ubuntu development tools..."
    
    # Development packages
    dev_packages=(
        build-essential
        cmake
        ninja-build
        pkg-config
        libtool
        automake
        autoconf
        gettext
        postgresql
        postgresql-contrib
        mysql-server
        redis-server
        sqlite3
        libsqlite3-dev
    )
    
    for package in "${dev_packages[@]}"; do
        if ! dpkg -l | grep -q "^ii  $package "; then
            echo "Installing $package..."
            sudo apt install -y "$package" || echo "Warning: Failed to install $package"
        else
            echo "$package already installed, skipping..."
        fi
    done
    
elif [ "$OS" == "Arch" ]; then
    echo "Installing Arch development tools..."
    
    # Development packages
    dev_packages=(
        base-devel
        cmake
        ninja
        postgresql
        mysql
        redis
        sqlite
    )
    
    for package in "${dev_packages[@]}"; do
        if ! pacman -Q "$package" >/dev/null 2>&1; then
            echo "Installing $package..."
            sudo pacman -S "$package" --noconfirm || echo "Warning: Failed to install $package"
        else
            echo "$package already installed, skipping..."
        fi
    done
fi

# Install common development tools
echo "Setting up common development tools..."

# Setup directories
mkdir -p ~/Projects
mkdir -p ~/bin

echo -e "\n${GREEN}Development tools installation completed!${NORMAL}"
