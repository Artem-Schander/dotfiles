#!/bin/bash

echo -e "\n\n${GREEN}Installing packages via Pacman/Yay (Arch/Manjaro)${NORMAL}"
echo "==============================${NORMAL}"

# Function to check if package is installed
package_installed() {
    pacman -Q "$1" >/dev/null 2>&1
}

# Function to check if AUR package is installed
aur_package_installed() {
    yay -Q "$1" >/dev/null 2>&1 || pacman -Q "$1" >/dev/null 2>&1
}

# Update system
echo "Updating system packages..."
sudo pacman -Syu --noconfirm

# Essential packages
essential_packages=(
    base-devel
    git
    curl
    wget
    unzip
    zip
    zsh
    tmux
    neovim
    tree
    htop
    jq
)

echo "Installing essential packages..."
for package in "${essential_packages[@]}"; do
    if ! package_installed "$package"; then
        echo "Installing $package..."
        sudo pacman -S "$package" --noconfirm
    else
        echo "$package already installed, skipping..."
    fi
done

# Development packages
dev_packages=(
    # Build tools
    gcc
    cmake
    ninja
    make
    
    # Text processing and search
    the_silver_searcher
    ripgrep
    ack
    fd
    bat
    fzf
    
    # Development tools
    universal-ctags
    python
    python-pip
    nodejs
    npm
    yarn
    php
    
    # System tools
    xclip
    xsel
    highlight
    tree-sitter
    
    # Network tools
    net-tools
    curl
    
    # Additional utilities
    neofetch
    zoxide
)

echo "Installing development packages..."
for package in "${dev_packages[@]}"; do
    if ! package_installed "$package"; then
        echo "Installing $package..."
        sudo pacman -S "$package" --noconfirm || echo "Warning: Failed to install $package"
    else
        echo "$package already installed, skipping..."
    fi
done

# Install yay (AUR helper) if not present
if ! command -v yay >/dev/null 2>&1; then
    echo "Installing yay (AUR helper)..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd /home/runner/work/dotfiles/dotfiles
fi

# AUR packages
if command -v yay >/dev/null 2>&1; then
    echo "Installing AUR packages..."
    
    aur_packages=(
        git-flow-avh
        lazygit
        lazydocker
        visual-studio-code-bin
        google-chrome
        ttf-monaspace
    )
    
    for package in "${aur_packages[@]}"; do
        if ! aur_package_installed "$package"; then
            echo "Installing $package from AUR..."
            yay -S "$package" --noconfirm || echo "Warning: Failed to install $package"
        else
            echo "$package already installed, skipping..."
        fi
    done
fi

# Optional packages for desktop environment
optional_packages=(
    # Desktop environment tools
    i3-wm
    polybar
    rofi
    compton
    feh
    arandr
    redshift
    blueman
    
    # Terminal and utilities
    kitty
    ranger
    
    # Media and graphics
    python-pillow
    
    # System utilities
    brightnessctl
    numlockx
    unclutter
    xarchiver
    
    # Development
    docker
    docker-compose
)

echo "Installing optional packages (desktop environment)..."
for package in "${optional_packages[@]}"; do
    if ! package_installed "$package"; then
        echo "Installing $package..."
        sudo pacman -S "$package" --noconfirm || echo "Warning: Failed to install $package"
    else
        echo "$package already installed, skipping..."
    fi
done

# Setup services
echo "Setting up services..."

# Docker service
if package_installed docker; then
    if ! systemctl is-active --quiet docker; then
        echo "Enabling and starting Docker service..."
        sudo systemctl enable docker
        sudo systemctl start docker
    fi
    
    # Add user to docker group
    sudo usermod -aG docker "${USER}" 2>/dev/null || true
fi

# NTP service
if package_installed ntp; then
    echo "Enabling network time protocol..."
    sudo timedatectl set-ntp true
fi

# Install Python packages
echo "Installing Python packages..."
python -m pip install --user --upgrade pip pillow glances psutil

# Install Node.js packages globally
if command -v npm >/dev/null 2>&1; then
    echo "Installing global Node.js packages..."
    npm install -g yarn neovim
fi

echo -e "\n${GREEN}Pacman/Yay package installation completed!${NORMAL}"

# Display post-installation notes
echo -e "\n${YELLOW}Post-installation notes:${NORMAL}"
echo "• Log out and back in for group changes to take effect"
echo "• Docker service has been enabled and started"
echo "• NTP has been enabled for automatic time synchronization"
