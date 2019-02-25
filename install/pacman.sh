#!/bin/sh

sudo pacman -Sy --noconfirm \
    perl-anyevent-i3 \
    docker \
    docker-compose \
    neovim \
    python-neovim \
    kitty \
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
    compton \
    rofi \
    fzf \
    feh \
    php \
    yay

yay -Sy --noconfirm \
    git-ftp \
    gitflow-avh \
    oh-my-zsh-git \
    google-chrome \
    slack-desktop \
    mailspring \
    earlyoom \
    teamviewer \
    anydesk \
    nvm

systemctl enable docker
systemctl start docker

# sudo usermod -aG docker ${USER}
# su - ${USER}
# id -nG
