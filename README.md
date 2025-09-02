# Dotfiles

> Welcome to my world. This is a collection of vim, tmux, and zsh configurations. Interested in a video walkthrough of the dotfiles? Check out my talk, [vim + tmux](https://www.youtube.com/watch?v=5r6yzFEXajQ).
>
> Obviously this setup work for me, a JavaScript developer on macOS, but this particular setup may not work for you. If this particular setup doesn't work for you, please steal ideas from this and if you like, contribute back tips, tricks, PRs, and other tidbits if you like!
>
> -- <cite>[nicknisi](https://github.com/nicknisi)</cite>

The original [repo](https://github.com/nicknisi/dotfiles) is really cool and I like most of the config. So I changed just a few things.

## Key Changes and Improvements

1. **Multi-Platform Support**: Added comprehensive support for macOS, Ubuntu, and Arch Linux (Manjaro)
2. **AstroNvim Integration**: Switched from LunarVim to [AstroNvim](https://github.com/AstroNvim/AstroNvim) for a modern Neovim experience
3. **Oh My Zsh**: Integrated [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for enhanced shell experience
4. **Improved Tmux**: Adapted configuration from [gpakosz/.tmux](https://github.com/gpakosz/.tmux)
5. **Robust Installation**: Added comprehensive error handling and platform detection

## Supported Platforms

- **macOS** (Intel and Apple Silicon)
- **Ubuntu/Debian** Linux distributions  
- **Arch Linux/Manjaro**

## Contents

+ [Quick Installation](#quick-installation)
+ [Features](#features)
+ [AstroNvim Setup](#astronvim-setup)
+ [ZSH Setup](#zsh-setup)
+ [Fonts](#fonts)
+ [Tmux Configuration](#tmux-configuration)
+ [Detailed Installation Guide](INSTALL.md)

## Quick Installation

```bash
git clone https://github.com/Artem-Schander/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

The installer will:
- Automatically detect your operating system
- Install platform-specific packages and dependencies
- Set up AstroNvim with proper configuration
- Configure zsh with Oh My Zsh
- Install essential development tools and fonts
- Create necessary symlinks with backup of existing files

## Features

### Intelligent Multi-Platform Installation
- Automatic OS detection (macOS, Ubuntu, Arch/Manjaro)
- Platform-specific package managers (Homebrew, APT, Pacman/Yay)
- Smart dependency resolution and error handling
- Backup creation for existing configurations

### Modern Development Environment
- **AstroNvim**: Modern Neovim distribution with LSP, Treesitter, and more
- **Enhanced Terminal**: tmux with custom configuration and powerline
- **Shell**: Zsh with Oh My Zsh and useful plugins
- **Fonts**: Nerd Fonts with ligature support (JetBrains Mono, Fira Code, etc.)

### Development Tools
- Git with enhanced configuration and flow
- Node.js with npm/yarn support
- Python development environment
- Essential CLI tools (ripgrep, fd, fzf, bat, tree, htop)
- Docker and containerization tools

## AstroNvim Setup

This dotfiles setup includes [AstroNvim](https://github.com/AstroNvim/AstroNvim), a modern Neovim distribution that provides:

- **LSP Integration**: Built-in Language Server Protocol support
- **Treesitter**: Advanced syntax highlighting and code analysis  
- **Plugin Management**: Using Lazy.nvim for fast plugin loading
- **Modern UI**: Beautiful interface with telescope, which-key, and more
- **Zero Configuration**: Works out of the box with sensible defaults

### Installation and Usage

AstroNvim is automatically installed and configured when you run the installer. The configuration is symlinked from `config/nvim/` to `~/.config/nvim/`.

To start using AstroNvim:

```bash
nvim
```

On first launch, AstroNvim will automatically install all plugins. This may take a few minutes.

### Key Features

- **Smart Autocompletion**: nvim-cmp with multiple sources
- **File Explorer**: Neo-tree for project navigation
- **Fuzzy Finding**: Telescope for files, buffers, and more
- **Git Integration**: Built-in git commands and diff viewing
- **Terminal Integration**: Toggleable terminal within Neovim
- **Language Support**: Pre-configured for popular languages

### Customization

AstroNvim configurations can be customized in:
- `config/nvim/lua/user/` - User-specific configurations
- `config/nvim/lua/plugins/` - Plugin configurations and overrides

For more information, visit the [AstroNvim documentation](https://github.com/AstroNvim/AstroNvim).

## Initial Setup and Installation

### Backup

First, you may want to backup any existing files that exist so this doesn't overwrite your work.

Run `install/backup.sh` to backup all symlinked files to a `~/dotfiles-backup` directory.

This will not delete any of these files, and the install scripts will not overwrite any existing. After the backup is complete, you can delete the files from your home directory to continue installation.

### Installation

The installer now supports multiple platforms and will automatically detect your system:

```bash
git clone https://github.com/Artem-Schander/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

The installation process:

1. **OS Detection**: Automatically identifies macOS, Ubuntu, or Arch Linux
2. **Package Installation**: Installs platform-specific packages and dependencies
3. **Submodules**: Initializes any git submodules
4. **Symlinks**: Creates symbolic links for all configurations
5. **AstroNvim Setup**: Configures Neovim with AstroNvim
6. **Shell Setup**: Configures Zsh with Oh My Zsh
7. **Development Tools**: Installs essential development packages
8. **Fonts**: Downloads and installs Nerd Fonts

### Platform-Specific Notes

#### macOS
- Installs Xcode Command Line Tools if needed
- Uses Homebrew for package management
- Includes Docker Desktop and GUI applications

#### Ubuntu/Debian
- Updates APT repositories and adds necessary PPAs
- Installs Docker and development tools
- Configures Flatpak for additional software

#### Arch Linux/Manjaro  
- Uses Pacman for system packages
- Installs Yay for AUR package access
- Configures system services (Docker, NTP)

For detailed installation information, see [INSTALL.md](INSTALL.md).

## ZSH Setup

ZSH is configured in the `zshrc.symlink` file, which will be symlinked to the home directory. The following occurs in this file:

* set the `EDITOR` to nvim
* Load any `~/.terminfo` setup
* Set the `CODE_DIR` variable, pointing to the location where the code projects exist for exclusive autocompletion with the `c` command
* Recursively search the `$DOTFILES/zsh` directory for files ending in .zsh and source them
* Setup zplug plugin manager for zsh plugins and installed them.
* source a `~/.localrc` if it exists so that additional configurations can be made that won't be kept track of in this dotfiles repo. This is good for things like API keys, etc.
* Add the `~/bin` and `$DOTFILES/bin` directories to the path
* And more...

### Prompt

The prompt is meant to be simple while still providing information to the user, particularly about the status of the git project, if the PWD is a git project.

The `precmd` shows the current working directory in it and the `PROMPT` shows the git.

#### Prompt Git Info

The git info shown on the `PROMPT` displays the current branch name, and whether it is dirty or clean.

![](https://cloud.githubusercontent.com/assets/1243826/23823231/63a51468-065e-11e7-9423-5461394ca484.png)

## Vim and Neovim Setup

This setup uses [AstroNvim](https://github.com/AstroNvim/AstroNvim), a modern Neovim distribution that provides an IDE-like experience out of the box.

### Why AstroNvim?

AstroNvim offers several advantages over traditional Vim configurations:

- **Modern Architecture**: Built on Neovim's latest features
- **LSP Integration**: Language Server Protocol support for intelligent code completion
- **Treesitter**: Advanced syntax highlighting and code understanding
- **Plugin Ecosystem**: Curated selection of the best Neovim plugins
- **Performance**: Optimized for speed with lazy loading
- **Maintainability**: Regular updates and community support

### Configuration Structure

|                         | Traditional Vim | AstroNvim Setup          |
|-------------------------|-----------------|--------------------------|
| Main Configuration      | `~/.vimrc`     | `~/.config/nvim/init.lua`|
| Configuration Directory | `~/.vim`       | `~/.config/nvim`         |
| Plugin Manager         | Various        | Lazy.nvim                |
| Language Support       | Manual         | Built-in LSP             |

### Installation

AstroNvim is automatically installed when you run the main installer. The process:

1. Installs Neovim for your platform
2. Creates symlinks from `config/nvim/` to `~/.config/nvim/`
3. Installs essential dependencies (ripgrep, fd, tree-sitter)
4. Backs up any existing Neovim configuration

### First Launch

When you first open Neovim after installation:

```bash
nvim
```

AstroNvim will automatically:
- Install all configured plugins
- Set up Language Server Protocols
- Download Treesitter parsers
- Configure all integrations

This initial setup may take a few minutes but only happens once.

### Key Bindings and Features

AstroNvim comes with sensible defaults and many powerful features:

- **Leader Key**: Space (` `)
- **File Explorer**: `<Leader>e` to toggle Neo-tree
- **Fuzzy Finding**: `<Leader>ff` to find files, `<Leader>fg` to search in files
- **Git Integration**: `<Leader>g` for git commands and status
- **LSP Actions**: `<Leader>l` for language server actions
- **Terminal**: `<Leader>t` for terminal management

For a complete guide, see `:help astronvim` within Neovim.

## Fonts

The setup includes automatic installation of multiple programming fonts with ligature support and Nerd Font icons.

### Included Fonts

- **JetBrains Mono**: Modern font with excellent ligatures
- **Fira Code**: Popular programming font with extensive ligature support  
- **Hasklig**: Fira Code variant optimized for Haskell
- **Victor Mono**: Cursive italic programming font
- **Nerd Font Variants**: All fonts include powerline and icon support

### Installation

Fonts are automatically installed during the main installation process:

- **macOS**: Fonts install to `~/Library/Fonts`
- **Linux**: Fonts install to `~/.local/share/fonts` with automatic cache refresh

### Terminal Configuration

For the best experience, configure your terminal to use:

- **Primary Font**: JetBrains Mono (or your preference)
- **Non-ASCII Font**: Any Nerd Font variant for icons and powerline
- **Ligatures**: Enable if supported by your terminal

### Supported Terminals

The font setup works well with:
- **iTerm2** (macOS) - Full ligature support
- **Alacritty** - Cross-platform with ligature support
- **Kitty** - GPU-accelerated with ligature support  
- **GNOME Terminal** - Good Linux default
- **Windows Terminal** - Modern Windows terminal

![Font Preview](https://cloud.githubusercontent.com/assets/1243826/23823422/8c35c5fe-0662-11e7-9c1f-6998f101901a.png)

## Tmux Configuration

Tmux is a terminal multiplexor which lets you create windows and splits in the terminal that you can attach and detach from. I use it to keep multiple projects open in separate windows and to create an IDE-like environment to work in where I can have my code open in vim/neovim and a shell open to run tests/scripts. Tmux is configured in [~/.tmux.conf.local](tmux/tmux.conf.local.symlink). This file defines the key bindings, the colors used, the layout of the tmux bar, and what what will be displayed, including the time and date, open windows, tmux session name, computer name, etc.

When tmux starts up, [login-shell](bin/login-shell) will be run and if it determines you are running this on macOS, it will call reattach-to-user-namespace, to fix the system clipboard for use inside of tmux.
