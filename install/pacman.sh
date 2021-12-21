#!/bin/bash

sudo pacman -Syu --noconfirm

for P in \
    xclip \
    xsel \
    gcc \
    unzip \
    xorg-xwininfo \
    xfce4-settings-manager \
    perl-anyevent-i3 \
    firefox-developer-edition \
    thunderbird \
    geary \
    docker \
    docker-compose \
    kitty \
    tmux \
    polybar \
    arandr \
    python-pip \
    numlockx \
    curl \
    the_silver_searcher \
    ripgrep \
    ack \
    tree \
    fasd \
    htop \
    zsh \
    nvm \
    brightnessctl \
    redshift \
    blueman \
    highlight \
    ranger \
    python-pillow \
    yarn \
    xclip \
    xarchiver \
    neofetch \
    net-tools \
    unclutter \
    compton \
    rofi \
    ntp \
    fzf \
    feh \
    rust \
    php \
    yay \
    base-devel \
    cmake \
    ninja \
    tree-sitter \
    xorg-server-xephyr

do
    if ! (pacman -Q | grep ${P} > /dev/null)
    then
        sudo pacman -S ${P} --noconfirm
    fi
done

if (pacman -Q | grep yay > /dev/null)
then
    for P in \
        git-ftp \
        gitflow-avh \
        universal-ctags \
        google-chrome \
        slack-desktop \
        visual-studio-code-bin \
        earlyoom \
        teamviewer \
        anydesk \
        dust \
        lazydocker \
        neovim
    do
        if ! (yay -Q | grep ${P} > /dev/null)
        then
            yay -Sy ${P} --noconfirm
        fi
    done
fi

if ! (systemctl is-active --quiet docker)
then
    systemctl enable docker
    systemctl start docker
fi

if ! (systemctl is-active --quiet teamviewerd)
then
    systemctl enable teamviewerd
    systemctl start teamviewerd
fi

# sudo usermod -aG docker ${USER}
# su - ${USER}
# id -nG

source /usr/share/nvm/init-nvm.sh
