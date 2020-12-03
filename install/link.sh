#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

GREEN="$(tput setaf 2)"
NORMAL="$(tput sgr0)"

createSymlink () {
    echo "Creating symlink for $1"
    ln -s $1 $2
}

echo -e "\n${GREEN}Creating symlinks"
echo "==============================${NORMAL}"

linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file '.symlink' )"
    if [ -e $target ]; then
        if [ -L "$target" ]; then
            echo "~${target#$HOME} symlink already exists... Skipping."
        else
            echo "~${target#$HOME} file already exists... creating backup to ~${target#$HOME}.bak"
            mv -f "$target" "$target.bak"
            createSymlink $file $target
        fi
    else
        createSymlink $file $target
    fi
done


echo -e "\n\n${GREEN}installing${NORMAL} to ~/.config${GREEN}"
echo "==============================${NORMAL}"

if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p $HOME/.config
fi
# configs=$( find -path "$DOTFILES/config.symlink" -maxdepth 1 )
for config in $DOTFILES/config/*; do
    target=$HOME/.config/$( basename $config )
    if [ -e $target ]; then
        if [ -L "$target" ]; then
            echo "~${target#$HOME} symlink already exists... Skipping."
        else
            echo "~${target#$HOME} file already exists... creating backup to ~${target#$HOME}.bak"
            mv -f "$target" "$target.bak"
            createSymlink $config $target
        fi
    else
        createSymlink $config $target
    fi
done
