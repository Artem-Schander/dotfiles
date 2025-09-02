#!/bin/bash

echo -e "\n\n${GREEN}Installing packages via APT (Ubuntu/Debian)${NORMAL}"
echo "==============================${NORMAL}"

# Function to check if package is installed
package_installed() {
    dpkg -l | grep -q "^ii  $1 "
}

# Update package lists
echo "Updating package lists..."
sudo apt update

# Add necessary repositories
echo "Adding repositories..."

# Yarn repository
if [ ! -f /etc/apt/sources.list.d/yarn.list ]; then
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
fi

# Docker repository
if ! package_installed docker-ce; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
fi

# Additional PPAs
sudo add-apt-repository -y ppa:neovim-ppa/stable 2>/dev/null || true
sudo add-apt-repository -y ppa:lazygit-team/release 2>/dev/null || true

# Update after adding repositories
sudo apt update

# Essential packages
echo "Installing essential packages..."
essential_packages=(
    software-properties-common
    build-essential
    libssl-dev
    apt-transport-https
    ca-certificates
    curl
    wget
    git
    unzip
    zip
)

for package in "${essential_packages[@]}"; do
    if ! package_installed "$package"; then
        echo "Installing $package..."
        sudo apt install -y "$package"
    else
        echo "$package already installed, skipping..."
    fi
done

# Development tools
echo "Installing development tools..."
dev_packages=(
    python3
    python3-pip
    nodejs
    npm
    neovim
    tmux
    zsh
    ripgrep
    fd-find
    tree
    htop
    silversearcher-ag
    ack
    universal-ctags
    git-flow
    highlight
    yarn
    jq
    cmake
    ninja-build
    gettext
    libtool
    libtool-bin
    autoconf
    automake
    pkg-config
    unzip
    curl
    doxygen
)

for package in "${dev_packages[@]}"; do
    if ! package_installed "$package"; then
        echo "Installing $package..."
        sudo apt install -y "$package" || echo "Warning: Failed to install $package"
    else
        echo "$package already installed, skipping..."
    fi
done

# Optional packages (UI and additional tools)
echo "Installing additional tools..."
additional_packages=(
    flatpak
    gnome-software-plugin-flatpak
    xclip
    xsel
    net-tools
    neofetch
    fzf
    bat
    docker-ce
    docker-compose
)

for package in "${additional_packages[@]}"; do
    if ! package_installed "$package"; then
        echo "Installing $package..."
        sudo apt install -y "$package" || echo "Warning: Failed to install $package (may not be available)"
    else
        echo "$package already installed, skipping..."
    fi
done

# Setup Docker if installed
if package_installed docker-ce; then
    echo "Setting up Docker..."
    sudo usermod -aG docker "${USER}" 2>/dev/null || true
    
    # Install docker-compose if not installed via apt
    if ! command -v docker-compose >/dev/null 2>&1; then
        echo "Installing docker-compose..."
        sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
        sudo chmod +x /usr/local/bin/docker-compose
    fi
fi

# Setup flatpak
if package_installed flatpak; then
    echo "Setting up Flatpak..."
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo 2>/dev/null || true
fi

# Install Node.js LTS if nodejs is old
node_version=$(node --version 2>/dev/null | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$node_version" -lt 16 ] 2>/dev/null; then
    echo "Installing Node.js LTS..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install -y nodejs
fi

echo -e "\n${GREEN}APT package installation completed!${NORMAL}"
