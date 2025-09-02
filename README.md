# ⚡ Modern Dotfiles

> A comprehensive, cross-platform dotfiles configuration featuring AstroNvim, Zsh with Oh My Zsh, and a complete development environment setup.

[![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20Ubuntu%20%7C%20Arch-blue.svg)](https://github.com/Artem-Schander/dotfiles)
[![Shell](https://img.shields.io/badge/shell-zsh-green.svg)](https://www.zsh.org/)
[![Editor](https://img.shields.io/badge/editor-neovim-brightgreen.svg)](https://neovim.io/)
[![Maintenance](https://img.shields.io/badge/maintained-yes-green.svg)](https://github.com/Artem-Schander/dotfiles/graphs/commit-activity)

## 📋 Table of Contents

- [🎯 Overview](#-overview)
- [📱 Screenshots](#-screenshots)
- [🚀 Quick Installation](#-quick-installation)
- [💻 Supported Platforms](#-supported-platforms)
- [✨ Features](#-features)
- [🔧 Configuration Details](#-configuration-details)
- [🛠️ Tools and Applications](#️-tools-and-applications)
- [📖 Usage](#-usage)
- [🐛 Troubleshooting](#-troubleshooting)
- [🤝 Contributing](#-contributing)


## 🎯 Overview

This dotfiles repository provides a modern, feature-rich development environment that works seamlessly across macOS, Ubuntu, and Arch Linux. Built with automation and ease of use in mind, it delivers a consistent and powerful workflow for developers.

### 🎨 Philosophy

- **Cross-platform compatibility** - Works on macOS, Ubuntu, and Arch Linux
- **Modern tooling** - Latest versions of development tools and applications
- **Intelligent automation** - Smart installation with error handling and backups
- **Minimal configuration** - Sensible defaults with easy customization
- **Performance focused** - Optimized configurations for speed and efficiency

### 🎯 Target Audience

Perfect for developers who want:
- A consistent development environment across different machines
- Modern terminal and editor experience
- Automated setup and configuration management
- Professional-grade development tools

## 📱 Screenshots

<!-- TODO: Add screenshot of overall desktop/terminal setup here -->
*Main terminal environment with AstroNvim, tmux, and zsh with Spaceship prompt*

<!-- TODO: Add screenshot of AstroNvim editor interface here -->
*AstroNvim with LSP integration, file explorer, and modern interface*

<!-- TODO: Add screenshot of tmux session with multiple panes here -->
*tmux configuration with multiple panes and custom status bar*

<!-- TODO: Add screenshot of i3 window manager setup (Linux) here -->
*i3 window manager with polybar, rofi, and custom theming*

<!-- TODO: Add screenshot of terminal with development workflow here -->
*Development workflow showing git integration and CLI tools*

<!-- TODO: Add screenshot of font ligatures and terminal aesthetics here -->
*Font ligatures and terminal aesthetics with Nerd Fonts*

## 🚀 Quick Installation

```bash
git clone https://github.com/Artem-Schander/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

The installer will automatically:
- 🔍 Detect your operating system
- 📦 Install platform-specific packages and dependencies
- ⚙️ Set up AstroNvim with proper configuration
- 🐚 Configure zsh with Oh My Zsh and Spaceship prompt
- 🔧 Install essential development tools and fonts
- 🔗 Create necessary symlinks with backup of existing files

<!-- TODO: Add screenshot of installation process here -->

## 💻 Supported Platforms

| Platform | Package Manager | Status | Notes |
|----------|----------------|--------|-------|
| 🍎 **macOS** | Homebrew | ✅ Full Support | Intel & Apple Silicon |
| 🐧 **Ubuntu/Debian** | APT | ✅ Full Support | 18.04+ and derivatives |
| 🏔️ **Arch Linux/Manjaro** | Pacman/Yay | ✅ Full Support | Including AUR packages |

## ✨ Features

### 🚀 Intelligent Multi-Platform Installation
- **Automatic OS detection** with platform-specific optimizations
- **Smart package management** using native package managers
- **Comprehensive error handling** with detailed feedback
- **Backup creation** for existing configurations
- **Dependency resolution** with duplicate checking

### 🖥️ Modern Development Environment

#### 📝 **AstroNvim** - Next-generation Neovim
- 🧠 **LSP Integration** - Built-in Language Server Protocol support
- 🌳 **Treesitter** - Advanced syntax highlighting and code analysis  
- ⚡ **Lazy Loading** - Fast startup with Lazy.nvim plugin manager
- 🎨 **Modern UI** - Beautiful interface with telescope, which-key, and more
- 🔧 **Zero Configuration** - Works out of the box with sensible defaults

#### 🐚 **Enhanced Shell Experience**
- **Zsh** with Oh My Zsh framework
- **Spaceship Prompt** with git integration and status indicators
- **Smart autocompletion** and syntax highlighting
- **Custom aliases** and functions for productivity

#### 🖼️ **Terminal Multiplexing**
- **tmux** with custom configuration adapted from [gpakosz/.tmux](https://github.com/gpakosz/.tmux)
- **Powerline status bar** with time, date, and session info
- **Mouse support** and intuitive key bindings
- **Session management** for project organization

#### 🎨 **Window Management** (Linux)
- **i3** tiling window manager configuration
- **Polybar** status bar with custom modules
- **Rofi** application launcher and dmenu replacement
- **Custom key bindings** and workspace management

### 🛠️ Development Tools
- **Git** with enhanced configuration and aliases
- **Node.js** with npm/yarn support and version management
- **Python** development environment with pip
- **Essential CLI tools** (ripgrep, fd, fzf, bat, tree, htop)
- **Docker** and containerization tools
- **Platform-specific databases** (PostgreSQL, MySQL, Redis)

### 🔤 **Premium Fonts**
- **Nerd Fonts** with icon and powerline support
- **JetBrains Mono** - Modern font with excellent ligatures
- **Fira Code** - Popular programming font with extensive ligature support  
- **Hasklig** - Fira Code variant optimized for functional languages
- **Victor Mono** - Cursive italic programming font

## 🔧 Configuration Details

### 📂 Repository Structure

```
~/.dotfiles/
├── 🗂️ config/              # Application configurations
│   ├── nvim/               # AstroNvim configuration
│   ├── alacritty/          # Alacritty terminal config
│   ├── i3/                 # i3 window manager config
│   ├── polybar/            # Polybar status bar config
│   └── ...
├── 🔧 install/             # Installation scripts
├── 🐚 zsh/                 # Zsh configuration and themes
├── 🖥️ tmux/               # tmux configuration
├── 📦 bin/                 # Custom scripts and utilities
├── ⚙️ git/                 # Git configuration
└── 📄 *.symlink            # Files to be symlinked to $HOME
```

### 🔗 Symlink Management

The dotfiles use two approaches for configuration management:

1. **`.symlink` files** - Automatically symlinked to `$HOME`
   ```
   gitconfig.symlink → ~/.gitconfig
   zshrc.symlink → ~/.zshrc
   ```

2. **`config/` directory** - Symlinked to `~/.config/`
   ```
   config/nvim/ → ~/.config/nvim/
   config/alacritty/ → ~/.config/alacritty/
   ```

### ⚙️ AstroNvim Configuration

| Component | Location | Description |
|-----------|----------|-------------|
| 🏠 Main Config | `config/nvim/init.lua` | Entry point and core settings |
| 👤 User Settings | `config/nvim/lua/user/` | Personal customizations |
| 🔌 Plugin Configs | `config/nvim/lua/plugins/` | Plugin configurations and overrides |
| 📝 Snippets | `config/nvim/snippets/` | Custom code snippets |

## 🛠️ Tools and Applications

### 🖥️ Terminal & Shell
| Tool | Purpose | Configuration |
|------|---------|---------------|
| 🐚 **Zsh** | Modern shell with powerful features | `zsh/zshrc.symlink` |
| 🎨 **Oh My Zsh** | Zsh framework with themes and plugins | Auto-installed |
| 🚀 **Spaceship** | Minimalist, powerful prompt | Custom configuration |
| 🖼️ **tmux** | Terminal multiplexer | `tmux/tmux.conf.symlink` |

### 📝 Editor & Development
| Tool | Purpose | Configuration |
|------|---------|---------------|
| ⚡ **AstroNvim** | Modern Neovim distribution | `config/nvim/` |
| 🧠 **LSP** | Language server integration | Built into AstroNvim |
| 🌳 **Treesitter** | Syntax highlighting | Built into AstroNvim |
| 🔍 **Telescope** | Fuzzy finder | Built into AstroNvim |

### 🖼️ Terminal Applications
| Tool | Purpose | Configuration |
|------|---------|---------------|
| 🖥️ **Alacritty** | GPU-accelerated terminal | `config/alacritty/` |
| 🐱 **Kitty** | Feature-rich terminal | `config/kitty/` |

### 🏠 Window Management (Linux)
| Tool | Purpose | Configuration |
|------|---------|---------------|
| 🖼️ **i3** | Tiling window manager | `config/i3/` |
| 📊 **Polybar** | Status bar | `config/polybar/` |
| 🚀 **Rofi** | Application launcher | `config/rofi/` |

### 🛠️ CLI Tools
| Tool | Purpose | Installation |
|------|---------|-------------|
| 🔍 **ripgrep** | Fast text search | Auto-installed |
| 📁 **fd** | Fast file finder | Auto-installed |
| 🔍 **fzf** | Fuzzy finder | Auto-installed |
| 🦇 **bat** | Cat with syntax highlighting | Auto-installed |
| 🌳 **tree** | Directory tree display | Auto-installed |
| 📊 **htop** | Process monitor | Auto-installed |

### 🎨 Fonts & Theming
| Font | Features | Use Case |
|------|----------|----------|
| ⚡ **JetBrains Mono** | Ligatures, readability | Primary coding font |
| 🔥 **Fira Code** | Extensive ligatures | Alternative coding font |
| λ **Hasklig** | Functional programming | Haskell/FP development |
| ✍️ **Victor Mono** | Cursive italics | Distinctive coding style |

## 📖 Usage

### 🚀 Getting Started

After installation, restart your terminal or run:
```bash
source ~/.zshrc
```

### 🎯 Key Workflows

#### 📝 **AstroNvim Usage**
```bash
# Launch Neovim
nvim

# Key bindings (Leader key: Space)
<Leader>e          # Toggle file explorer
<Leader>ff         # Find files
<Leader>fg         # Search in files  
<Leader>gg         # Lazygit
<Leader>t          # Terminal management
```

<!-- TODO: Add screenshot of AstroNvim key bindings help here -->

#### 🖼️ **tmux Usage**
```bash
# Start new session
tmux new-session -s project-name

# Key bindings (Prefix: Ctrl+a)
prefix + |         # Split horizontally
prefix + -         # Split vertically
prefix + h/j/k/l   # Navigate panes
prefix + I         # Install plugins
```

#### 🐚 **Zsh Features**
```bash
# Quick navigation
c <project>        # Jump to code directory
..                 # Go up one directory
...                # Go up two directories

# Git aliases
gst                # git status
gco                # git checkout
glog               # git log --oneline --graph
```

### 🎨 **Customization**

#### ✏️ **Personal Configurations**
Create a `~/.localrc` file for personal settings:
```bash
# API keys, personal aliases, etc.
export GITHUB_TOKEN="your-token-here"
alias mycommand="echo 'Hello World'"
```

#### 🔧 **AstroNvim Customization**
Edit user configurations:
```bash
nvim ~/.config/nvim/lua/user/init.lua
```

#### 🐚 **Zsh Customization**
Add custom configurations to `zsh/settings/` directory.

## 🐛 Troubleshooting

### ❗ Common Issues

#### 🔐 **Permission Errors**
```bash
# Ensure you have sudo access
sudo -v

# Fix zsh permissions
sudo chown -R $(whoami) ~/.oh-my-zsh
```

#### 🌐 **Network Issues**
- Ensure internet connectivity for package downloads
- Check firewall settings if downloads fail
- Use VPN if behind corporate firewall

#### 🖥️ **Platform Detection Issues**
```bash
# Manually check OS detection
cat /etc/os-release  # Linux
uname -a            # macOS
```

#### 🔤 **Font Issues**
```bash
# Linux - Refresh font cache
fc-cache -fv

# Verify fonts are installed
fc-list | grep -i "jetbrains\|fira\|hasklig"
```

#### 🐚 **Shell Issues**
```bash
# Manually change default shell
chsh -s $(which zsh)

# Verify zsh installation
which zsh
zsh --version
```

### 🔧 **Manual Recovery**

#### 📂 **Restore Backups**
```bash
# Backups are stored in ~/dotfiles-backup
ls ~/dotfiles-backup
cp ~/dotfiles-backup/.zshrc ~/.zshrc
```

#### 🔗 **Fix Symlinks**
```bash
# Re-run symlink creation
cd ~/.dotfiles
./install/link.sh
```

#### ⚡ **Reset AstroNvim**
```bash
# Remove AstroNvim data and cache
rm -rf ~/.local/share/nvim
rm -rf ~/.cache/nvim
nvim  # Will reinstall plugins
```

### 🆘 **Getting Help**

1. **Check installation logs** - Look for error messages during installation
2. **Verify dependencies** - Ensure all required packages are installed
3. **Test individual components** - Test each tool separately
4. **Create an issue** - If problems persist, create a GitHub issue with:
   - Operating system and version
   - Error messages
   - Steps to reproduce

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### 🐛 **Bug Reports**
- Use the issue tracker to report bugs
- Include system information and error messages
- Provide steps to reproduce the issue

### ✨ **Feature Requests**
- Suggest new tools or configurations
- Explain the use case and benefits
- Consider cross-platform compatibility

### 🔧 **Pull Requests**
1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Test across platforms if possible
5. Submit a pull request with a clear description

### 📝 **Coding Standards**
- **Shell scripts**: Follow bash best practices, use `shellcheck`
- **Configuration files**: Maintain consistent formatting
- **Documentation**: Update README for new features
- **Testing**: Test on multiple platforms when possible

### 📁 **Adding New Configurations**
1. **For new symlinks**: Add `*.symlink` files to appropriate directories
2. **For XDG configs**: Add to `config/` directory
3. **For installation**: Add platform-specific install scripts
4. **For documentation**: Update this README with new tools

## 🙏 **Acknowledgments**

- [AstroNvim](https://github.com/AstroNvim/AstroNvim) - Modern Neovim distribution
- [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh) - Zsh framework
- [gpakosz/.tmux](https://github.com/gpakosz/.tmux) - tmux configuration inspiration
- [Spaceship Prompt](https://github.com/spaceship-prompt/spaceship-prompt) - Zsh prompt theme

---

<div align="center">

**⭐ If you found this helpful, please consider giving it a star! ⭐**

</div>
