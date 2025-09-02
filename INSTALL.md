# Dotfiles Installation Guide

This repository provides a comprehensive dotfiles setup with multi-platform support and AstroNvim integration.

## Supported Platforms

- **macOS** (using Homebrew)
- **Ubuntu/Debian** (using APT)
- **Arch Linux/Manjaro** (using Pacman/Yay)

## Quick Installation

```bash
git clone https://github.com/Artem-Schander/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## What Gets Installed

### Core Components
- **Shell**: Zsh with Oh My Zsh
- **Editor**: Neovim with AstroNvim configuration
- **Terminal Multiplexer**: tmux with custom configuration
- **Fonts**: Nerd Fonts (FiraCode, JetBrains Mono, Hasklig, Victor Mono)

### Development Tools
- Git with enhanced configuration
- Node.js and npm/yarn
- Python and pip
- Essential CLI tools (ripgrep, fd, fzf, bat, tree, htop)
- Platform-specific package managers and build tools

### Platform-Specific Packages

#### macOS (Homebrew)
- Xcode Command Line Tools
- Homebrew package manager
- Docker Desktop
- Development databases (PostgreSQL, MySQL, Redis)

#### Ubuntu/Debian (APT)
- Build essentials and development libraries
- Docker and Docker Compose
- Flatpak support
- Modern CLI alternatives

#### Arch Linux/Manjaro (Pacman/Yay)
- Base development packages
- AUR helper (yay) for extended package access
- Desktop environment tools (i3, polybar, rofi)
- System services configuration

## Features

### Intelligent Installation
- Automatic OS detection
- Package installation with duplicate checking
- Backup creation for existing configurations
- Comprehensive error handling and user feedback

### AstroNvim Integration
- **Fixed**: Uses AstroNvim instead of LunarVim
- Proper symlink creation for configuration
- Automatic plugin installation on first launch
- Platform-specific neovim installation

### Configuration Management
- Automatic symlink creation for dotfiles
- Backup of existing configurations
- Support for both `*.symlink` files and `config/` directory structure

## Post-Installation

1. **Restart your terminal** or run `source ~/.zshrc`
2. **Launch Neovim**: Run `nvim` and plugins will install automatically
3. **Configure tmux plugins**: Start tmux and press `prefix + I` to install plugins
4. **Verify installation**: All tools should be available in your PATH

## Troubleshooting

### Common Issues

#### Permission Errors
- Ensure you have sudo access for package installation
- Some operations may require password input

#### Network Issues
- Installation requires internet access for downloading packages and fonts
- Check your connection if downloads fail

#### Platform Detection
- If OS detection fails, check `/etc/os-release` on Linux systems
- macOS detection uses `uname` output

### Manual Steps

#### Change Default Shell
If zsh wasn't set as default automatically:
```bash
chsh -s $(which zsh)
```

#### Font Installation
If fonts don't appear, restart applications or run:
```bash
# Linux
fc-cache -fv

# macOS
# Fonts install to ~/Library/Fonts automatically
```

## Customization

### Adding Your Own Configurations
- Add `*.symlink` files to the root directory
- Add configuration directories to `config/`
- Modify platform-specific installers in `install/`

### AstroNvim Configuration
- Main config: `config/nvim/`
- User customizations: `config/nvim/lua/user/`
- Plugin configurations: `config/nvim/lua/plugins/`

## Testing

Run the test suite to verify installation readiness:
```bash
./test_installer.sh  # (if available)
```

## Support

This installer has been tested on:
- macOS 10.15+ (Intel and Apple Silicon)
- Ubuntu 18.04+ and derivatives
- Arch Linux and Manjaro

For issues or contributions, please check the repository's issue tracker.