#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "\n\nUpdateing homebrew..."
echo "=============================="

brew update

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

brew install bash

# cli tools
brew install ack
brew install tree
brew install wget
brew install ctags
brew install php-cs-fixer
brew install python
brew install python3

# development server setup
brew install nginx
brew install dnsmasq

# development tools
brew install git
brew install hub
brew install macvim --override-system-vim
brew install reattach-to-user-namespace

# brew install tmux
brew install toilet
brew install zsh
brew install highlight
brew install nvm
brew install z
brew install markdown
brew install diff-so-fancy

# install neovim
pip2 install neovim --upgrade
pip3 install neovim --upgrade
brew install neovim

# exit 0
