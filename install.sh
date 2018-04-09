#!/bin/bash

set -e

DOTPATH=~/dotfiles
GITHUB_URL=https://github.com/arwtyxouymz/dotfiles

# git が使えるなら git
if [ has "git" ]; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"
elif [ has "curl" || has "wget" ]; then
    tarball="https://github.com/arwtyxouymz/dotfiles/archive/master.tar.gz"

    # どっちかでダウンロードして，tar に流す
    if [ has "curl" ]; then
        curl -L "$tarball"

    elif [ has "wget" ]; then
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

