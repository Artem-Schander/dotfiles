#!/usr/bin/env bash

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Installing dotfiles"

echo "Initializing submodule(s)"
if [ -f /etc/lsb-release ]; then
    sudo apt update
    sudo apt install -y git
fi
git submodule update --init --recursive

source install/link.sh

# only perform macOS-specific install
if [ "$(uname)" == "Darwin" ]; then
    echo -e "\n\nRunning on OSX"

    source install/git.sh

    source install/brew.sh

    source install/osx.sh

    # create a backup of the original nginx.conf
    if [ -f /usr/local/etc/nginx/nginx.conf ]; then
        mv /usr/local/etc/nginx/nginx.conf /usr/local/etc/nginx/nginx.conf.original
    fi

    ln -s ~/.dotfiles/nginx/nginx.conf /usr/local/etc/nginx/nginx.conf

    # symlink the code.dev from dotfiles
    ln -s ~/.dotfiles/nginx/code.dev /usr/local/etc/nginx/sites-enabled/code.dev
elif [ -f /etc/lsb-release ]; then
    echo -e "\n\nRunning on Linux (Debian)"

    source install/apt.sh

    source install/git.sh

    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    rm -rf .fzf

    cp resources/fonts/Hasklig/* ~/.local/share/fonts/
    cp resources/fonts/FiraCode/otf/* ~/.local/share/fonts/
    cp resources/fonts/NerdFonts/FiraCode/OTF/* ~/.local/share/fonts/
    # cp resources/fonts/NerdFonts/Hasklig/* ~/.local/share/fonts/

    # make the lest alt key behave like the right one
    setxkbmap -option lv3:lalt_switch

    # set keyboard delay and repeat rate
    gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
    gsettings set org.gnome.desktop.peripherals.keyboard delay 250

    # install kitty terminal
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
        launch=n
    ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
    sed -i "s/Icon\=kitty/Icon\=\/home\/$USER\/.local\/kitty.app\/share\/icons\/hicolor\/256x256\/apps\/kitty.png/g" ~/.local/share/applications/kitty.desktop

    # symlink kitty terminal config file
    mkdir -p ~/.config/kitty/
    ln -s ~/.dotfiles/config/kitty/kitty.conf.symlink ~/.config/kitty/kitty.conf

    # add pillow to system so the kitty image preview works
    pip install pillow

    # symlink ranger terminal config file
    mkdir -p ~/.config/ranger/
    ln -s ~/.dotfiles/config/ranger/rc.conf.symlink ~/.config/ranger/rc.conf
fi


source install/nvim.sh

source install/tmux.sh

source install/nvm.sh

source install/composer.sh

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
