#!/bin/sh

DOTFILES=$HOME/.dotfiles

GREEN="$(tput setaf 2)"
NORMAL="$(tput sgr0)"

echo -e "\n\n${GREEN}Installing fonts"
echo "==============================${NORMAL}"

if [ ! -d $DOTFILES/resources/fonts/NerdFonts ]; then
    echo "Creating ~/.dotfiles/resources/fonts/NerdFonts"
    mkdir -p $DOTFILES/resources/fonts/NerdFonts
fi

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip -P $DOTFILES/resources/fonts/NerdFonts/
unzip -o $DOTFILES/resources/fonts/NerdFonts/FiraCode.zip -d ~/.local/share/fonts
rm -f $DOTFILES/resources/fonts/NerdFonts/FiraCode.zip

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hasklig.zip -P $DOTFILES/resources/fonts/NerdFonts/
unzip -o $DOTFILES/resources/fonts/NerdFonts/Hasklig.zip -d ~/.local/share/fonts
rm -f $DOTFILES/resources/fonts/NerdFonts/Hasklig.zip

wget https://rubjo.github.io/victor-mono/VictorMonoAll.zip -P $DOTFILES/resources/fonts/VictorMono/
unzip -o $DOTFILES/resources/fonts/VictorMono/VictorMonoAll.zip -d ~/.local/share/fonts
rm -rf $DOTFILES/resources/fonts/VictorMono

wget https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip -P $DOTFILES/resources/fonts/JetBrainsMono/
unzip -o $DOTFILES/resources/fonts/JetBrainsMono/JetBrainsMono-2.242.zip -d ~/.local/share/fonts
rm -rf $DOTFILES/resources/fonts/JetBrainsMono

fc-cache -fv
