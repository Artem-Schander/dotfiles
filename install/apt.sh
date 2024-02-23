#!/bin/bash

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt install -y \
    software-properties-common \
    build-essential \
    libssl-dev \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    flatpak \
    # bat \
    # gir1.2-clutter-1.0 \ # dependencies for clutter / blyr
    # gir1.2-clutter-gst-3.0 \ # dependencies for clutter / blyr
    # gir1.2-gtkclutter-1.0 \ # dependencies for clutter / blyr
    gnome-software-plugin-flatpak


flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository -y ppa:hnakamur/universal-ctags ppa:ondrej/php \
    ppa:lazygit-team/release \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt update
apt-cache policy docker-ce

sudo apt install -y \
    git \
    python-pip \
    python3-pip \
    curl \
    php-xdebug \
    php7.2-cli \
    php7.2-mbstring \
    php7.2-zip \
    php7.2-xml \
    silversearcher-ag \
    ripgrep \
    ack \
    tree \
    zoxide \
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
    x11-utils \
    xclip \
    net-tools \
    neofetch \
    i3 \
    rofi \
    compton \
    feh \
    docker-ce

sudo usermod -aG docker ${USER}
su - ${USER}
id -nG

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
