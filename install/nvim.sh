#!/bin/bash

echo -e "\n\n${GREEN}Installing neovim"
echo "==============================${NORMAL}"

curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh

# TODO: add aliases
# ~/.config/lvim/config.lua -> ~/.dotfiles/config/lvim/config.lua
# ~/.config/lvim/lua -> ~/.dotfiles/config/lvim/lua
# ~/.config/lvim/vimscript -> ~/.dotfiles/config/lvim/vimscript
# ~/.config/lvim/ftplugin -> ~/.dotfiles/config/lvim/ftplugin
