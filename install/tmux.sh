#!/bin/sh

GREEN="$(tput setaf 2)"
NORMAL="$(tput sgr0)"

echo -e "\n\n${GREEN}Installing Tmux"
echo "==============================${NORMAL}"

if [ "$(uname)" == "Darwin" ]; then
    if brew list tmux > /dev/null 2>&1; then
        echo "tmux already installed... skipping."
    else
        brew install tmux
    fi
fi

if [ -d ~/.tmux/plugins/tpm ]; then
    # printf "${YELLOW}You already have Tmux Plugin Manager installed.${NORMAL}\n"
    cd ~/.tmux/plugins/tpm
    git fetch
    git pull
    cd -
else
    git clone git://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
