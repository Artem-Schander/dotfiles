#!/bin/sh

sudo pacman -Syu --noconfirm

for P in \
    xclip \
    xsel \
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
    ntp \
    fzf \
    feh \
    rust \
    php \
    yay

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
        nvm

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
