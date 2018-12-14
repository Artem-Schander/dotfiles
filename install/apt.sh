#!/bin/sh

if [ -f /etc/lsb-release ]; then
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

    sudo apt update
    sudo apt install -y software-properties-common build-essential libssl-dev
    sudo add-apt-repository -y ppa:hnakamur/universal-ctags ppa:ondrej/php

    sudo apt update
    sudo apt install -y \
        git \
        python3-pip \
        curl \
        php-xdebug \
        php7.2-cli \
        php7.2-mbstring \
        php7.2-zip \
        php7.2-xml \
        silversearcher-ag \
        ack \
        tree \
        fasd \
        toilet \
        universal-ctags \
        htop \
        git-ftp \
        git-flow \
        zsh \
        highlight \
        yarn \
        gnome-tweak-tool \
        chrome-gnome-shell \
        x11-utils
fi
