#!/bin/bash

set -e

DOTPATH=~/dotfiles
GITHUB_URL=https://github.com/arwtyxouymz/dotfiles

# git が使えるなら git
if type git > /dev/null 2>&1; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"
elif type curl > /dev/null 2>&1 || type wget > /dev/null 2>&1; then
    tarball="https://github.com/arwtyxouymz/dotfiles/archive/master.tar.gz"

    # どっちかでダウンロードして，tar に流す
    if type curl > /dev/null 2>&1; then
        curl -L "$tarball"

    elif type wget > /dev/null 2>&1; then
        wget -O - "$tarball"
    fi | tar xv -

    # 解凍したら，DOTPATH に置く
    mv -f dotfiles-master "$DOTPATH"
else
    echo "curl or wget required"
    exit 1
fi

cd ~/.dotfiles

# OS 判別
if [ "$(uname)" == 'Darwin' ]; then
    OS='Mac'
    sh ./OSX_INSTALL.sh
elif [ "$(uname)" == 'Linux' ]; then
    OS='Linux'
    sh ./LINUX_INSTALL.sh
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

