#!/bin/sh

GREEN="$(tput setaf 2)"
NORMAL="$(tput sgr0)"

echo -e "\n\n${GREEN}Installing neovim"
echo "==============================${NORMAL}"

pip2 install neovim --upgrade
pip3 install neovim --upgrade

if [ "$(uname)" == "Darwin" ]; then
    if brew list neovim/neovim/neovim > /dev/null 2>&1; then
        echo "neovim already installed... skipping."
    else
        brew install neovim/neovim/neovim
    fi
fi