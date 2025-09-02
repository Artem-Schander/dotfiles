#!/bin/bash

DOTFILES=$HOME/.dotfiles

echo -e "\n\n${GREEN}Installing fonts${NORMAL}"
echo "==============================${NORMAL}"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Set font directory based on OS
if [ "$OS" == "Darwin" ]; then
    FONT_DIR="$HOME/Library/Fonts"
else
    FONT_DIR="$HOME/.local/share/fonts"
fi

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

# Function to install Monaspace with multiple fallback URLs
install_monaspace() {
    local font_name="Monaspace"
    local temp_dir="/tmp/font_install_$$"
    local success=false
    
    # Try multiple potential URLs
    local urls=(
        "https://github.com/githubnext/monaspace/releases/download/v1.000/monaspace-v1.000.zip"
        "https://github.com/githubnext/monaspace/releases/download/v1.001/monaspace-v1.001.zip"
        "https://github.com/githubnext/monaspace/releases/download/v1.101/monaspace-v1.101.zip"
    )
    
    echo "Attempting to install $font_name..."
    
    mkdir -p "$temp_dir"
    cd "$temp_dir"
    
    for url in "${urls[@]}"; do
        echo "Trying: $url"
        
        if command_exists curl; then
            curl -L -o "$font_name.zip" "$url" 2>/dev/null
        elif command_exists wget; then
            wget -O "$font_name.zip" "$url" 2>/dev/null
        else
            echo "Error: Neither curl nor wget found. Cannot download fonts."
            rm -rf "$temp_dir"
            return 1
        fi
        
        # Check if we got a valid zip file (more than 1000 bytes)
        if [ -f "$font_name.zip" ] && [ $(stat -c%s "$font_name.zip" 2>/dev/null || stat -f%z "$font_name.zip" 2>/dev/null || echo "0") -gt 1000 ]; then
            if unzip -t "$font_name.zip" >/dev/null 2>&1; then
                echo "✓ Successfully downloaded $font_name from $url"
                
                # Extract fonts to subdirectory first
                mkdir -p monaspace_temp
                unzip -o "$font_name.zip" -d monaspace_temp/ >/dev/null 2>&1
                
                # Find and copy font files
                find monaspace_temp/ -type f \( -name "*.ttf" -o -name "*.otf" \) -exec cp {} "$FONT_DIR/" \; 2>/dev/null
                
                # Count installed fonts
                local font_count=$(find monaspace_temp/ -type f \( -name "*.ttf" -o -name "*.otf" \) | wc -l)
                if [ "$font_count" -gt 0 ]; then
                    echo "✓ $font_name installed successfully ($font_count fonts)"
                    success=true
                    break
                else
                    echo "Warning: No font files found in downloaded archive"
                fi
            else
                echo "Warning: Downloaded file is not a valid zip archive"
            fi
        else
            echo "Warning: Download failed or file too small"
        fi
        
        # Clean up for next attempt
        rm -f "$font_name.zip"
    done
    
    cd - > /dev/null
    rm -rf "$temp_dir"
    
    if [ "$success" = false ]; then
        echo "Warning: Failed to install $font_name from all attempted URLs"
        echo "You can manually download Monaspace fonts from: https://github.com/githubnext/monaspace/releases"
        return 1
    fi
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
