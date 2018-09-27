#!/bin/bash

DOTPATH=${HOME}/dotfiles
GITHUB_URL=https://github.com/arwtyxouymz/dotfiles

if [ $(uname) = "Darwin" ]; then
    # Command Line Tools のインストール
    echo $'\e[32mInstalling the CommandLineTools\e[0m'
    xcode-select --install
fi

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
    fi | tar xvzf -

    # 解凍したら，DOTPATH に置く
    mv -f dotfiles-master "$DOTPATH"
else
    echo "curl or wget required"
    exit 1
fi

cd ${DOTPATH}
