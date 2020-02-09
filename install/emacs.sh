#!/bin/sh

GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
NORMAL="$(tput sgr0)"

echo -e "\n\n${GREEN}Installing Emacs"
echo "==============================${NORMAL}"

if [ "$(uname)" == "Darwin" ]; then
    if [ -d $HOME/.emacs.d ]; then
        echo "emacs-mac already installed... skipping."
    else
        brew tap railwaycat/emacsmacport
        brew cask install emacs-mac
    fi

    if [ -d $HOME/.doom.d ]; then
        echo "Doom Emacs already installed... skipping."
    else
        git clone https://github.com/hlissner/doom-emacs $HOME/.emacs.d
        cd $HOME/.emacs.d && git checkout develop
        $HOME/.emacs.d/bin/doom install

        if [ ! -f $HOME/.doom.d/init.el.bak && -f $HOME/.doom.d/init.el ]; then
            mv $HOME/.doom.d/init.el $HOME/.doom.d/init.el.bak
            if [ ! -f $HOME/.doom.d/init.el ]; then
                ln -s $HOME/.dotfiles/emacs/doom/init.el.symlink $HOME/.doom.d/init.el
            fi
        fi

        if [ ! -f $HOME/.doom.d/config.el.bak && -f $HOME/.doom.d/config.el ]; then
            mv $HOME/.doom.d/config.el $HOME/.doom.d/config.el.bak
            if [ ! -f $HOME/.doom.d/config.el ]; then
                ln -s $HOME/.dotfiles/emacs/doom/config.el.symlink $HOME/.doom.d/config.el
            fi
        fi

        if [ ! -f $HOME/.doom.d/packages.el.bak && -f $HOME/.doom.d/packages.el ]; then
            mv $HOME/.doom.d/packages.el $HOME/.doom.d/packages.el.bak
            if [ ! -f $HOME/.doom.d/packages.el ]; then
                ln -s $HOME/.dotfiles/emacs/doom/packages.el.symlink $HOME/.doom.d/packages.el
            fi
        fi
    fi

elif [ -f /etc/lsb-release ]; then
    # apt update
    # apt install -y tmux
    echo "TODO"
fi
