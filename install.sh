#!/usr/bin/env bash

RED="$(tput setaf 1)"
YELLOW="$(tput setaf 3)"
NORMAL="$(tput sgr0)"

CYAN="$(tput setaf 6)"

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Recognize OS"
if [ -f /etc/os-release ]; then
    # freedesktop.org and systemd
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
    # linuxbase.org
    OS=$(lsb_release -si)
    VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    OS=$DISTRIB_ID
    VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    OS=Debian
    VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
    # Older SuSE/etc.
    ...
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    ...
else
    # Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
    OS=$(uname -s)
    VER=$(uname -r)
fi
echo $OS

echo "Installing dotfiles"

echo "Initializing submodule(s)"
if [ "$OS" == "Ubuntu Linux" ]; then
    sudo apt update && apt install -y git
fi
git submodule update --init --recursive

source install/link.sh

# only perform macOS-specific install
if [ "$OS" == "Darwin" ]; then
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

    # install neovim
    source install/nvim.sh

    # install tmux
    source install/tmux.sh

    # install node version manager
    source install/nvm.sh

elif [ "$OS" == "Manjaro Linux" ]; then
    echo -e "\n\nRunning on Linux (Arch)"

    source install/pacman.sh

    source install/git.sh

    if [ -d ~/.tmux/plugins/tpm ]; then
        # printf "${YELLOW}You already have Tmux Plugin Manager installed.${NORMAL}\n"
        cd ~/.tmux/plugins/tpm
        git fetch
        git pull
        cd -
    else
        git clone git://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi

    mkdir -p ~/.local/share/fonts/
    cp ~/.dotfiles/resources/fonts/Hasklig/* ~/.local/share/fonts/
    cp ~/.dotfiles/resources/fonts/FiraCode/otf/* ~/.local/share/fonts/
    cp ~/.dotfiles/resources/fonts/NerdFonts/FiraCode/OTF/* ~/.local/share/fonts/
    # cp ~/.dotfiles/resources/fonts/NerdFonts/Hasklig/* ~/.local/share/fonts/

    # pillow is needed to render images in kitty terminal
    sudo pip install -U pillow

    # symlink i3 config file
    if [ ! -d ~/.i3 ]; then
        mkdir ~/.i3
    fi
    if [ ! -f ~/.i3/config.bak ]; then
        mv ~/.i3/config ~/.i3/config.bak
    fi
    ln -s ~/.dotfiles/config/i3/config ~/.i3/config

elif [ "$OS" == "Ubuntu Linux" ]; then
    echo -e "\n\nRunning on Linux (Debian)"

    source install/apt.sh

    source install/git.sh

    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    rm -rf ~/.fzf

    cp ~/.dotfiles/resources/fonts/Hasklig/* ~/.local/share/fonts/
    cp ~/.dotfiles/resources/fonts/FiraCode/otf/* ~/.local/share/fonts/
    cp ~/.dotfiles/resources/fonts/NerdFonts/FiraCode/OTF/* ~/.local/share/fonts/
    # cp ~/.dotfiles/resources/fonts/NerdFonts/Hasklig/* ~/.local/share/fonts/

    # make the left alt key behave like the right one
    setxkbmap -option lv3:lalt_switch

    # set keyboard delay and repeat rate
    gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
    gsettings set org.gnome.desktop.peripherals.keyboard delay 250

    # install kitty
    source install/kitty.sh

    # add pillow to system so the kitty image preview works
    pip install pillow

    # install i3-gaps
    source install/i3-gaps.sh

    # install polybar
    source install/polybar.sh

    # install rofi
    source install/rofi.sh

    # install neovim
    source install/nvim.sh

    # install tmux
    source install/tmux.sh

    # install node version manager
    source install/nvm.sh

fi

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
