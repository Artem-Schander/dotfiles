#!/bin/sh

GREEN="$(tput setaf 2)"
NORMAL="$(tput sgr0)"

echo -e "\n\n${GREEN}Installing Node${NORMAL} (from nvm)${GREEN}"
echo "==============================${NORMAL}"

if [ "$(uname)" == "Darwin" ]; then
    source $(brew --prefix nvm)/nvm.sh
elif [ -f /etc/lsb-release ]; then
    curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi

nvm install stable
nvm alias default stable
