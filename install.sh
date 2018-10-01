#!/usr/bin/env bash

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Installing dotfiles"

echo "Initializing submodule(s)"
git submodule update --init --recursive

source install/link.sh

source install/git.sh

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning on OSX"

    source install/brew.sh

    source install/osx.sh

    source install/nvim.sh # TODO: check not for Darwin OS only

    source install/tmux.sh # TODO: check not for Darwin OS only

    source install/nvm.sh # TODO: check not for Darwin OS only

    source install/composer.sh # TODO: check not for Darwin OS only

    # create a backup of the original nginx.conf
    if [ -f /usr/local/etc/nginx/nginx.conf ]; then
        mv /usr/local/etc/nginx/nginx.conf /usr/local/etc/nginx/nginx.conf.original
    fi

    ln -s ~/.dotfiles/nginx/nginx.conf /usr/local/etc/nginx/nginx.conf

    # symlink the code.dev from dotfiles
    ln -s ~/.dotfiles/nginx/code.dev /usr/local/etc/nginx/sites-enabled/code.dev
fi

# echo -e "\n\n${GREEN}creating vim directories"
# echo "==============================${NORMAL}"
mkdir -p ~/.vim-tmp

if ! command_exists zsh; then
    echo "zsh not found. Please install and then re-run installation scripts"
    exit 1
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Configuring zsh as default shell"
    chsh -s $(which zsh)
fi

RED="$(tput setaf 1)"
YELLOW="$(tput setaf 3)"
NORMAL="$(tput sgr0)"

CYAN="$(tput setaf 6)"

source install/omz.sh

echo -e "\n\n${GREEN}Done. Restart your Terminal."
echo "==============================${NORMAL}"

# if [ "$(uname)" == "Darwin" ]; then
#     toilet -f future -F border ' Remember to install the vim pligins ! ' -t && toilet -f smmono9 '   ~/$ vim +PlugInstall' -t
# else
    printf "${RED}Remember to install the plugins!${NORMAL}\n"
    printf "${GREEN}  --> vim: ${NORMAL} ${CYAN}vim +PlugInstall!${NORMAL}\n"
    printf "${GREEN}  --> tmux: ${NORMAL} run ${CYAN}prefix + I${NORMAL} inside a tmux session\n"
# fi

echo -e "\n"
