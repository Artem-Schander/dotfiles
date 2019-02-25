#!/bin/sh

if [ -f /etc/lsb-release ]; then

    # install kitty terminal
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin \
        launch=n
    ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
    cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
    sed -i "s/Icon\=kitty/Icon\=\/home\/$USER\/.local\/kitty.app\/share\/icons\/hicolor\/256x256\/apps\/kitty.png/g" ~/.local/share/applications/kitty.desktop

    # symlink kitty terminal config file
    mkdir -p ~/.config/kitty/
    ln -s ~/.dotfiles/config/kitty/kitty.conf ~/.config/kitty/kitty.conf

fi
