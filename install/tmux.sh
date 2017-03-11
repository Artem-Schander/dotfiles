#!/bin/sh

echo -e "\n\nInstalling Tmux"
echo "=============================="

brew install tmux

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
