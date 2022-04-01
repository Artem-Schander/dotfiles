#!/bin/bash

if test ! $(which brew); then
    echo -e "\n\n${GREEN}Installing homebrew"
    echo "==============================${NORMAL}"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo -e "\n\n${GREEN}Updating homebrew"
    echo "==============================${NORMAL}"
    brew update
fi

echo -e "\n\n${GREEN}Tap additional homebrew repositories of formulae"
echo "==============================${NORMAL}"
brew tap phinze/homebrew-cask

echo -e "\n\n${GREEN}Installing homebrew packages"
echo "==============================${NORMAL}"

formulas=(
    # flags should pass through the the `brew list check`
    bash
    docker-machine-nfs
    lazydocker
    brew-cask
    unison
    eugenmayer/dockersync/unox
    # cli tools
    the_silver_searcher
    ack
    fzf
    tree
    fasd
    toilet
    wget
    '--HEAD universal-ctags/universal-ctags/universal-ctags'
    htop
    brotli
    python2
    python3
    # development server setup
    nginx
    mariadb
    dnsmasq
    # development tools
    git
    git-ftp
    git-flow-avh
    lazygit
    hub
    macvim
    # 'brew install php71-mcrypt php71-imagick php71-intl php71-redis'
    reattach-to-user-namespace
    # tmux # is getting installed through own script
    zsh
    highlight
    yarn
    nvm
    z
    markdown
    diff-so-fancy
    ccls
    cmake
    clang
    llvm
    # docker
    # docker-compose
    # docker-machine
    # xhyve
    # docker-machine-driver-xhyve

    # 'grep --with-default-names'
    # neovim # is getting installed through own script
    # node
    # ripgrep
    # git-standup
    # entr
    # bat
)

for formula in "${formulas[@]}"; do
    if brew list $formula > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        brew install $formula
    fi
done

echo -e "\n\n${GREEN}Install Docker"
echo "==============================${NORMAL}"
sudo gem install docker-sync
brew cask install docker
open /Applications/Docker.app

echo -e "\n\n${GREEN}Install Fira Code Font"
echo "==============================${NORMAL}"
brew tap caskroom/fonts
brew cask install font-fira-code

echo -e "\n\n${GREEN}Install JetBrains Mono Font"
echo "==============================${NORMAL}"
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

echo -e "\n\n${GREEN}Install Glances"
echo "==============================${NORMAL}"
pip install --upgrade glances
pip install --upgrade psutil

echo -e "\n\n${GREEN}Running fzf install script"
echo "==============================${NORMAL}"
/usr/local/opt/fzf/install --all --no-bash --no-fish
