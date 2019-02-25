#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles

GREEN="$(tput setaf 2)"
NORMAL="$(tput sgr0)"

echo -e "\n${GREEN}Creating symlinks"
echo "==============================${NORMAL}"

linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file '.symlink' )"
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
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
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s $config $target
    fi
done

# create vim symlinks
# As I have moved off of vim as my full time editor in favor of neovim,
# I feel it doesn't make sense to leave my vimrc intact in the dotfiles repo
# as it is not really being actively maintained. However, I would still
# like to configure vim, so lets symlink ~/.vimrc and ~/.vim over to their
# neovim equivalent.

echo -e "\n\n${GREEN}Creating vim symlinks"
echo "==============================${NORMAL}"

# typeset -A vimfiles
# vimfiles[~/.vim]=$DOTFILES/config/nvim
# vimfiles[~/.vimrc]=$DOTFILES/config/nvim/init.vim
# 
# for file in "${!vimfiles[@]}"; do
#     if [ -e ${file} ]; then
#         echo "${file} already exists... skipping"
#     else
#         echo "Creating symlink for $file"
#         ln -s ${vimfiles[$file]} $file
#     fi
# done
