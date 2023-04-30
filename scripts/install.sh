#!/bin/bash

# check if this script run in Cygwin
if [ "$(uname -o)" != "Cygwin" ]; then
    # check if this script run in sudo
    if [ "$(id -u)" != "0" ]; then
        echo "This script must be run as root" 1>&2
        exit 1
    fi
fi

if [ "$(uname -o)" == "Cygwin" ]; then
    PKG_MANAGER="apt-cyg"
else
    PKG_MANAGER="apt"
fi

# install packages
PACKAGES="git wget curl zsh"

$PKG_MANAGER update
$PKG_MANAGER install $PACKAGES

# install oh-my-zsh if not installed
if [ ! -d ~/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# install zsh-syntax-highlighting, zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# add plugins to .zshrc
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc
