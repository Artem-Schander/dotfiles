#!/bin/sh

if [ -f /etc/lsb-release ]; then
    # sudo apt update
    sudo apt install -y \
        libalsaplayer-dev \
        cmake \
        cmake-data \
        libcairo2-dev \
        libxcb1-dev \
        libxcb-ewmh-dev \
        libxcb-icccm4-dev \
        libxcb-image0-dev \
        libxcb-randr0-dev \
        libxcb-util0-dev \
        libxcb-xkb-dev \
        libxcb-composite0-dev \
        pkg-config \
        python-xcbgen \
        xcb-proto \
        libxcb-xrm-dev \
        i3-wm \
        libasound2-dev \
        libmpdclient-dev \
        libiw-dev \
        libcurl4-openssl-dev \
        libpulse-dev

    cd /tmp

    # clone the repository
    git clone --recursive https://github.com/jaagr/polybar.git polybar

    # compile & install
    cd polybar && ./build.sh -f

    sudo rm -rf /tmp/polybar
fi

mkdir -p ~/.config/polybar
rm -f ~/.config/polybar/config
ln -s ~/.dotfiles/config/polybar/config ~/.config/polybar/config
