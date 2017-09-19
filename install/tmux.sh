#!/bin/sh

echo -e "\n\nInstalling Tmux"
echo "=============================="

brew install tmux

if [ -d ~/.tmux/plugins/tpm ]; then
    # printf "${YELLOW}You already have Tmux Plugin Manager installed.${NORMAL}\n"
    cd ~/.tmux/plugins/tpm
    git fetch
    git pull
else
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
