#!/usr/bin/env bash

export RED="$(tput setaf 1)"
export GREEN="$(tput setaf 2)"
export YELLOW="$(tput setaf 3)"
export CYAN="$(tput setaf 6)"
export NORMAL="$(tput sgr0)"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function for error handling
handle_error() {
    echo -e "\n${RED}Error: $1${NORMAL}"
    echo "Installation failed. Please check the error above and try again."
    exit 1
}

# Function for success messages
success_message() {
    echo -e "\n${GREEN}✓ $1${NORMAL}"
}

echo -e "\n\n${GREEN}Installing dotfiles"
echo -e "==============================${NORMAL}"
echo -e "Supporting: macOS, Ubuntu, Arch Linux (Manjaro)"

# Detect OS
source install/recognize-os.sh

if [ -z "$OS" ]; then
    handle_error "Unable to detect operating system. Supported: macOS, Ubuntu, Arch Linux"
fi

echo -e "\n${GREEN}Detected OS: $OS${NORMAL}"

# Install platform-specific packages
if [ "$OS" == "Darwin" ]; then
    echo -e "\n\nRunning on macOS"
    source install/brew.sh || handle_error "Homebrew installation failed"
    source install/osx.sh || handle_error "macOS setup failed"
elif [ "$OS" == "Ubuntu" ]; then
    echo -e "\n\nRunning on Linux (Ubuntu)"
    source install/apt.sh || handle_error "APT package installation failed"
elif [ "$OS" == "Arch" ]; then
    echo -e "\n\nRunning on Linux (Arch/Manjaro)"
    source install/pacman.sh || handle_error "Pacman package installation failed"
else
    handle_error "Unsupported operating system: $OS"
fi

success_message "Platform-specific packages installed"

# Setup git
echo -e "\n${GREEN}Setting up git configuration${NORMAL}"
source install/git.sh || handle_error "Git setup failed"
success_message "Git configured"

# Initialize submodules
echo -e "\n${GREEN}Initializing submodule(s)${NORMAL}"
git submodule update --init --recursive || handle_error "Failed to initialize submodules"
success_message "Submodules initialized"

# Install oh-my-zsh
echo -e "\n${GREEN}Installing Oh My Zsh${NORMAL}"
source install/omz.sh || handle_error "Oh My Zsh installation failed"
success_message "Oh My Zsh installed"

# Create symlinks
echo -e "\n${GREEN}Creating symlinks${NORMAL}"
source install/link.sh || handle_error "Symlink creation failed"
success_message "Symlinks created"

# Install neovim and AstroNvim
echo -e "\n${GREEN}Installing Neovim and AstroNvim${NORMAL}"
source install/nvim.sh || handle_error "Neovim installation failed"
success_message "Neovim and AstroNvim installed"

# Install tmux
echo -e "\n${GREEN}Installing tmux${NORMAL}"
source install/tmux.sh || handle_error "Tmux installation failed"
success_message "Tmux installed"

# Install development tools
echo -e "\n${GREEN}Installing development tools${NORMAL}"
source install/dev.sh || handle_error "Development tools installation failed"
success_message "Development tools installed"

# Install composer
# echo -e "\n${GREEN}Installing Composer${NORMAL}"
# source install/composer.sh || handle_error "Composer installation failed"
# success_message "Composer installed"

# Install node version manager
echo -e "\n${GREEN}Installing Node Version Manager${NORMAL}"
source install/nvm.sh || handle_error "NVM installation failed"
success_message "Node Version Manager installed"

# Install fonts
echo -e "\n${GREEN}Installing fonts${NORMAL}"
source install/fonts.sh || handle_error "Font installation failed"
success_message "Fonts installed"

# Final setup
echo -e "\n${GREEN}Performing final setup${NORMAL}"

# Create vim directories
mkdir -p ~/.vim-tmp

# Check if zsh is installed and set as default shell
if ! command_exists zsh; then
    handle_error "zsh not found. Please install zsh and re-run installation"
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo -e "\n${YELLOW}Configuring zsh as default shell${NORMAL}"
    chsh -s $(which zsh) || echo -e "${YELLOW}Warning: Could not change default shell to zsh. You may need to do this manually.${NORMAL}"
fi

echo -e "\n\n${GREEN}================================================================="
echo -e "✓ Dotfiles installation completed successfully!"
echo -e "=================================================================${NORMAL}"

echo -e "\n${CYAN}Next steps:${NORMAL}"
echo -e "  ${GREEN}1.${NORMAL} Restart your terminal or run: ${CYAN}source ~/.zshrc${NORMAL}"
echo -e "  ${GREEN}2.${NORMAL} Launch neovim: ${CYAN}nvim${NORMAL} (plugins will install automatically)"
echo -e "  ${GREEN}3.${NORMAL} Launch tmux and install plugins: ${CYAN}tmux${NORMAL} then press ${CYAN}prefix + I${NORMAL}"

echo -e "\n${YELLOW}Remember to install the plugins:${NORMAL}"
echo -e "  ${GREEN}→ vim:${NORMAL} Launch nvim and plugins will install automatically"
echo -e "  ${GREEN}→ tmux:${NORMAL} Run ${CYAN}prefix + I${NORMAL} inside a tmux session"

echo -e "\n"


