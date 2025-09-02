#!/bin/bash

echo -e "\n\n${GREEN}Installing neovim and setting up AstroNvim"
echo "==============================${NORMAL}"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install neovim based on OS
if [ "$OS" == "Darwin" ]; then
    if ! command_exists nvim; then
        echo "Installing neovim via Homebrew..."
        brew install neovim
    else
        echo "Neovim already installed, skipping..."
    fi
elif [ "$OS" == "Ubuntu" ]; then
    if ! command_exists nvim; then
        echo "Installing neovim via apt..."
        sudo apt update
        sudo apt install -y neovim
    else
        echo "Neovim already installed, skipping..."
    fi
elif [ "$OS" == "Arch" ]; then
    if ! command_exists nvim; then
        echo "Installing neovim via pacman..."
        sudo pacman -S --noconfirm neovim
    else
        echo "Neovim already installed, skipping..."
    fi
fi

# Create backup of existing nvim config if it exists and is not our config
if [ -d ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then
    if [ ! -d ~/.config/nvim.bak ]; then
        echo "Backing up existing nvim config to ~/.config/nvim.bak"
        mv ~/.config/nvim ~/.config/nvim.bak
    else
        echo "Backup already exists, removing current nvim config..."
        rm -rf ~/.config/nvim
    fi
fi

# Create symlink to our AstroNvim config
if [ ! -L ~/.config/nvim ]; then
    echo "Creating symlink to AstroNvim configuration..."
    mkdir -p ~/.config
    ln -sf ~/.dotfiles/config/nvim ~/.config/nvim
    echo "AstroNvim configuration linked successfully!"
else
    echo "Neovim config symlink already exists, skipping..."
fi

# Install dependencies for neovim
echo "Installing additional dependencies..."
if [ "$OS" == "Darwin" ]; then
    # Install additional tools via Homebrew
    brew install ripgrep fd tree-sitter
elif [ "$OS" == "Ubuntu" ]; then
    # Install additional tools via apt
    sudo apt install -y ripgrep fd-find
elif [ "$OS" == "Arch" ]; then
    # Install additional tools via pacman
    sudo pacman -S --noconfirm ripgrep fd tree-sitter
fi

echo -e "\n${GREEN}AstroNvim setup complete!${NORMAL}"
echo "Run 'nvim' to start and the plugins will install automatically on first launch."
