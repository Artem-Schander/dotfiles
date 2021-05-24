#!/bin/bash

echo -e "\n\n${GREEN}Installing neovim"
echo "==============================${NORMAL}"

# pip2 install --user neovim --upgrade
# pip3 install --user neovim --upgrade
# pip3 install --no-cache-dir --upgrade --force-reinstall neovim
pip3 list | grep pynvim >/dev/null && echo "pynvim installed, moving on..." || pip3 install pynvim --user




installnodemac() {
    brew install lua
    brew install node
    brew install yarn
}

installnodeubuntu() {
    sudo apt install nodejs
    sudo apt install npm
}

moveoldnvim() {
    echo "Not installing LunarVim"
    echo "Please move your ~/.config/nvim folder before installing"
    exit
}

installnodearch() {
    sudo pacman -S nodejs
    sudo pacman -S npm
}

installnodefedora() {
    sudo dnf install -y nodejs 
    sudo dnf install -y npm
}

installnode() {
    echo "Installing node..."

    if [ "$OS" == "Darwin" ]; then
        installnodemac
    elif [ "$OS" == "Ubuntu" ]; then
        installnodeubuntu
    elif [ "$OS" == "Arch" ]; then
        installnodearch
    elif [ "$OS" == "Fedora" ]; then
        installnodefedora
    fi

    sudo npm i -g neovim
}

asktoinstallnode() {
    echo "node not found"
    echo -n "Would you like to install node now (y/n)? "
    read answer
    [ "$answer" != "${answer#[Yy]}" ] && installnode
}

# install node and neovim support
which node >/dev/null && echo "node installed, moving on..." || asktoinstallnode

if [ -e "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
    echo 'packer already installed'
else
    git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

# if [ -e "$HOME/.config/nvim/init.lua" ]; then
#     nvim -u $HOME/.config/nvim/init.lua +PackerInstall
# else
#     echo 'missing nvim configuration'
# fi
