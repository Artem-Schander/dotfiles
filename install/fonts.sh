#!/bin/bash

DOTFILES=$HOME/.dotfiles

echo -e "\n\n${GREEN}Installing fonts${NORMAL}"
echo "==============================${NORMAL}"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

QUIET=true source $HOME/.dotfiles/install/recognize-os.sh

# Set font directory based on OS
if [ "$OS" == "Darwin" ]; then
    FONT_DIR="$HOME/Library/Fonts"
else
    FONT_DIR="$HOME/.local/share/fonts"
fi

echo "Installing fonts to: $FONT_DIR"

# Create font directories
mkdir -p "$FONT_DIR"
mkdir -p "$DOTFILES/resources/fonts"

echo "Installing fonts to: $FONT_DIR"

# Function to download and install font
install_font() {
    local font_name="$1"
    local download_url="$2"
    local temp_dir="/tmp/font_install_$$"

    echo "Installing $font_name..."

    mkdir -p "$temp_dir"
    cd "$temp_dir"

    if command_exists curl; then
        curl -L -o "$font_name.zip" "$download_url"
    elif command_exists wget; then
        wget -O "$font_name.zip" "$download_url"
    else
        echo "Error: Neither curl nor wget found. Cannot download fonts."
        return 1
    fi

    if [ -f "$font_name.zip" ]; then
        unzip -o "$font_name.zip" -d "$FONT_DIR/" 2>/dev/null || {
            echo "Warning: Failed to extract $font_name.zip"
            rm -rf "$temp_dir"
            return 1
        }
        echo "✓ $font_name installed successfully"
    else
        echo "Warning: Failed to download $font_name"
    fi

    cd - > /dev/null
    rm -rf "$temp_dir"
}

# Install Nerd Fonts
echo "Installing Nerd Fonts..."
install_font "FiraCode" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"
install_font "Hasklig" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hasklig.zip"
install_font "JetBrainsMono" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"

# Install additional fonts
echo "Installing additional fonts..."
install_font "VictorMono" "https://rubjo.github.io/victor-mono/VictorMonoAll.zip"

# Install Monaspace fonts
echo "Installing Monaspace fonts..."

# Function to install Monaspace fonts using the most elegant approaches
install_monaspace() {
    local font_name="Monaspace"

    echo "Attempting to install $font_name..."

    # Method 1: Try package managers first (most elegant)
    if [ "$OS" == "Darwin" ] && command_exists brew; then
        echo "Checking Homebrew for Monaspace fonts..."

        # Try different possible cask names
        local cask_names="font-monaspace monaspace-font font-monaspace-nerd-font"

        for cask_name in $cask_names; do
            echo "Trying: brew install --cask $cask_name"
            if brew install --cask "$cask_name" 2>/dev/null; then
                echo "✓ $font_name installed via Homebrew ($cask_name)"
                return 0
            fi
        done

        echo "Monaspace not available in Homebrew, trying alternative methods..."

    elif [ "$OS" == "Linux" ]; then
        # Check for package managers on Linux
        if command_exists pacman; then
            echo "Checking pacman for Monaspace fonts..."
            local package_names="ttf-monaspace monaspace-font ttf-monaspace-nerd"

            for package_name in $package_names; do
                if sudo pacman -S --noconfirm "$package_name" 2>/dev/null; then
                    echo "✓ $font_name installed via pacman ($package_name)"
                    return 0
                fi
            done
        fi

        if command_exists apt-get; then
            echo "Checking apt for Monaspace fonts..."
            if sudo apt-get update >/dev/null 2>&1 && sudo apt-get install -y fonts-monaspace 2>/dev/null; then
                echo "✓ $font_name installed via apt"
                return 0
            fi
        fi

        echo "Monaspace not available in system package managers, trying alternative methods..."
    fi

    # Method 2: Use GitHub API to get latest release
    echo "Fetching latest Monaspace release from GitHub API..."
    local api_url="https://api.github.com/repos/githubnext/monaspace/releases/latest"
    local temp_dir="/tmp/font_install_$$"

    mkdir -p "$temp_dir"
    cd "$temp_dir"

    if command_exists curl; then
        local release_info=$(curl -s "$api_url" 2>/dev/null)
        local download_url=$(echo "$release_info" | grep -o '"browser_download_url":[[:space:]]*"[^"]*\.zip"' | head -1 | cut -d '"' -f 4)

        if [ -n "$download_url" ]; then
            echo "Found latest release: $download_url"
            echo "Downloading Monaspace fonts..."

            if curl -L -o "$font_name.zip" "$download_url" 2>/dev/null; then
                if [ -f "$font_name.zip" ] && [ $(stat -c%s "$font_name.zip" 2>/dev/null || stat -f%z "$font_name.zip" 2>/dev/null || echo "0") -gt 1000 ]; then
                    if unzip -t "$font_name.zip" >/dev/null 2>&1; then
                        echo "✓ Successfully downloaded $font_name"

                        # Extract fonts
                        mkdir -p monaspace_temp
                        unzip -o "$font_name.zip" -d monaspace_temp/ >/dev/null 2>&1

                        # Find and copy font files
                        local font_count=$(find monaspace_temp/ -type f \( -name "*.ttf" -o -name "*.otf" \) -exec cp {} "$FONT_DIR/" \; 2>/dev/null | wc -l)

                        if [ "$font_count" -gt 0 ]; then
                            echo "✓ $font_name installed successfully from GitHub release ($font_count fonts)"
                            cd - > /dev/null
                            rm -rf "$temp_dir"
                            return 0
                        fi
                    fi
                fi
            fi
        fi
    fi

    # Method 3: Clone repository approach (most reliable fallback)
    echo "GitHub API method failed, trying repository clone approach..."

    if command_exists git; then
        local repo_dir="monaspace_repo"

        if git clone --depth 1 https://github.com/githubnext/monaspace.git "$repo_dir" 2>/dev/null; then
            echo "✓ Successfully cloned Monaspace repository"

            # Find font files in the cloned repository
            local font_files=$(find "$repo_dir" -type f \( -name "*.ttf" -o -name "*.otf" \) 2>/dev/null)

            if [ -n "$font_files" ]; then
                local font_count=0
                echo "$font_files" | while read -r font_file; do
                    if cp "$font_file" "$FONT_DIR/" 2>/dev/null; then
                        font_count=$((font_count + 1))
                    fi
                done

                echo "✓ $font_name installed successfully from repository"
                cd - > /dev/null
                rm -rf "$temp_dir"
                return 0
            fi
        else
            echo "Failed to clone Monaspace repository"
        fi
    fi

    cd - > /dev/null
    rm -rf "$temp_dir"

    echo ""
    echo "⚠️  All automatic installation methods failed for Monaspace fonts"
    echo ""
    echo "Manual installation options:"
    echo "1. Download from: https://github.com/githubnext/monaspace/releases/latest"
    echo "2. Extract the zip file and copy .ttf/.otf files to:"
    echo "   • macOS: ~/Library/Fonts/"
    echo "   • Linux: ~/.local/share/fonts/"
    echo ""
    echo "3. For package managers:"
    if [ "$OS" == "Darwin" ]; then
        echo "   • Try: brew tap homebrew/cask-fonts && brew install --cask font-monaspace"
    elif [ "$OS" == "Linux" ]; then
        echo "   • Arch Linux: Try AUR package 'ttf-monaspace'"
        echo "   • Ubuntu/Debian: Check for PPA or snap package"
    fi
    echo ""
    return 1
}

install_monaspace

# Platform-specific font handling
if [ "$OS" == "Darwin" ]; then
    echo "macOS font installation completed"
    echo "Fonts are installed in ~/Library/Fonts"
else
    # Linux systems - refresh font cache
    if command_exists fc-cache; then
        echo "Refreshing font cache..."
        fc-cache -fv > /dev/null 2>&1
    fi

    echo "Linux font installation completed"
    echo "Fonts are installed in ~/.local/share/fonts"
fi

# Copy existing fonts from resources if they exist
if [ -d "$DOTFILES/resources/fonts" ]; then
    echo "Copying existing fonts from resources..."
    find "$DOTFILES/resources/fonts" -name "*.ttf" -o -name "*.otf" | while read font; do
        cp "$font" "$FONT_DIR/" 2>/dev/null && echo "✓ Copied $(basename "$font")"
    done
fi

echo -e "\n${GREEN}Font installation completed!${NORMAL}"
echo "Note: You may need to restart applications to see the new fonts."
