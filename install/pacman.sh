#!/bin/sh

sudo pacman -Sy --noconfirm \
    xclip xsel \
    xorg-xwininfo \
    perl-anyevent-i3 \
    thunderbird \
    docker \
    docker-compose \
    neovim \
    python-neovim \
    kitty \
    tmux \
    polybar \
    arandr \
    python-pip \
    numlockx \
    curl \
    the_silver_searcher \
    ack \
    tree \
    fasd \
    universal-ctags \
    htop \
    zsh \
    highlight \
    yarn \
    xclip \
    neofetch \
    net-tools \
    unclutter \
    compton \
    rofi \
    fzf \
    feh \
    rust \
    php \
    yay

yay -Sy --noconfirm \
    git-ftp \
    gitflow-avh \
    google-chrome \
    slack-desktop \
    earlyoom \
    teamviewer \
    anydesk \
    dust \
    nvm

systemctl enable docker
systemctl start docker

systemctl enable teamviewerd
systemctl start teamviewerd

# sudo usermod -aG docker ${USER}
# su - ${USER}
# id -nG
