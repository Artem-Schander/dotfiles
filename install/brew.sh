#!/bin/bash

echo -e "\n\n${GREEN}Installing packages via Homebrew (macOS)${NORMAL}"
echo "==============================${NORMAL}"

# Function to check if formula is installed
formula_installed() {
    brew list "$1" >/dev/null 2>&1
}

# Install or update Homebrew
if ! command -v brew >/dev/null 2>&1; then
    echo -e "\n${GREEN}Installing Homebrew${NORMAL}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ $(uname -m) == "arm64" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo -e "\n${GREEN}Updating Homebrew${NORMAL}"
    brew update
fi

echo -e "\n${GREEN}Installing Homebrew packages${NORMAL}"

# Essential CLI tools
essential_formulas=(
    git
    zsh
    tmux
    neovim
    curl
    wget
    tree
    htop
    jq
)

echo "Installing essential packages..."
for formula in "${essential_formulas[@]}"; do
    if formula_installed "$formula"; then
        echo "$formula already installed, skipping..."
    else
        echo "Installing $formula..."
        brew install "$formula"
    fi
done

# Development tools
dev_formulas=(
    # Search and text processing
    the_silver_searcher
    ripgrep
    ack
    fzf
    fd
    bat
    
    # Development tools
    universal-ctags
    git-flow-avh
    lazygit
    hub
    diff-so-fancy
    sublime-merge
    
    # Language tools
    php
    node
    python3
    cmake
    ninja
    
    # System tools
    zoxide
    highlight
    markdown
    
    # Compression and utilities
    unzip
    brotli
)

echo "Installing development tools..."
for formula in "${dev_formulas[@]}"; do
    if formula_installed "$formula"; then
        echo "$formula already installed, skipping..."
    else
        echo "Installing $formula..."
        brew install "$formula" || echo "Warning: Failed to install $formula"
    fi
done

# Optional tools
optional_formulas=(
    yarn
    nvm
    lazydocker
    toilet
    reattach-to-user-namespace
)

echo "Installing optional tools..."
for formula in "${optional_formulas[@]}"; do
    if formula_installed "$formula"; then
        echo "$formula already installed, skipping..."
    else
        echo "Installing $formula..."
        brew install "$formula" || echo "Warning: Failed to install $formula"
    fi
done

# Install cask applications
echo -e "\n${GREEN}Installing GUI applications via Homebrew Cask${NORMAL}"

cask_formulas=(
    font-symbols-only-nerd-font
    font-jetbrains-mono
    font-fira-code
    docker
)

for cask in "${cask_formulas[@]}"; do
    if brew list --cask "$cask" >/dev/null 2>&1; then
        echo "$cask already installed, skipping..."
    else
        echo "Installing $cask..."
        brew install --cask "$cask" || echo "Warning: Failed to install $cask"
    fi
done

# Install Python packages
echo -e "\n${GREEN}Installing Python packages${NORMAL}"
python3 -m pip install --upgrade pip
python3 -m pip install --user glances psutil pillow

# Run fzf install script
echo -e "\n${GREEN}Setting up fzf${NORMAL}"
if command -v fzf >/dev/null 2>&1; then
    fzf_install_path=$(brew --prefix)/opt/fzf/install
    if [ -f "$fzf_install_path" ]; then
        "$fzf_install_path" --all --no-bash --no-fish
    fi
fi

echo -e "\n${GREEN}Homebrew package installation completed!${NORMAL}"
