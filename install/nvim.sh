#!/bin/sh

GREEN="$(tput setaf 2)"
NORMAL="$(tput sgr0)"

echo -e "\n\n${GREEN}Installing neovim"
echo "==============================${NORMAL}"

# pip2 install --user neovim --upgrade
# pip3 install --user neovim --upgrade
pip3 install --no-cache-dir --upgrade --force-reinstall neovim

if [ "$(uname)" == "Darwin" ]; then
    if brew list neovim/neovim/neovim > /dev/null 2>&1; then
        echo "neovim already installed... skipping."
    else
        brew install neovim/neovim/neovim
    fi
elif [ -f /etc/lsb-release ]; then
    apt update
    apt install -y neovim
fi
