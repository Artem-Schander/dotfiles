#!/bin/sh

GREEN="$(tput setaf 2)"
NORMAL="$(tput sgr0)"

if test ! $(which brew); then
    echo -e "\n\n${GREEN}Installing homebrew"
    echo "==============================${NORMAL}"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo -e "\n\n${GREEN}Updating homebrew"
    echo "==============================${NORMAL}"
    brew update
fi

echo -e "\n\n${GREEN}Installing homebrew packages"
echo "==============================${NORMAL}"

formulas=(
    # flags should pass through the the `brew list check`
    bash
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
    homebrew/php/php-cs-fixer
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
    # docker
    # docker-compose
    # docker-machine
    # xhyve
    # docker-machine-driver-xhyve

    # 'grep --with-default-names'
    neovim
    # node
    # ripgrep
    # git-standup
    # entr
)

for formula in "${formulas[@]}"; do
    if brew list $formula > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        brew install $formula
    fi
done

echo -e "\n\n${GREEN}Running fzf install script"
echo "==============================${NORMAL}"
/usr/local/opt/fzf/install --all --no-bash --no-fish
