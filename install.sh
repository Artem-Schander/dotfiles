#!/usr/bin/env bash

echo "Installing dotfiles"

# echo "Initializing submodule(s)"
# git submodule update --init --recursive

source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning on OSX"

    source install/brew.sh

    source install/osx.sh

    source install/nvm.sh

    source install/omz.sh
    
	source install/tmux.sh

    # create a backup of the original nginx.conf
    mv /usr/local/etc/nginx/nginx.conf /usr/local/etc/nginx/nginx.original
    ln -s ~/.dotfiles/nginx/nginx.conf /usr/local/etc/nginx/nginx.conf
    # symlink the code.dev from dotfiles
    if [ ! -d /usr/local/etc/nginx/sites-enabled ]; then
      mkdir /usr/local/etc/nginx/sites-enabled
    fi
    ln -s ~/.dotfiles/nginx/sites-availible/code.dev /usr/local/etc/nginx/sites-enabled/code.dev
fi

echo "creating vim directories"
mkdir -p ~/.vim-tmp

# printf "💡 ${YELLOW}Remember to install the vim pligins!${NORMAL} vim +PlugInstall!\n"
toilet -f future -F border ' Remember to install the vim pligins ! ' -t && toilet -f smmono9 '   ~/$ vim +PlugInstall' -t

echo "Configuring zsh as default shell"
chsh -s $(which zsh)

YELLOW="$(tput setaf 3)"
NORMAL="$(tput sgr0)"

echo "Done."
