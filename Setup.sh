#!/bin/bash

set -e

# echo "Installing the CommandLineTools"
# xcode-select --install
#
# echo "Installing homebrew ............"
# which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#
# echo "Running brew doctor ............"
# which brew >/dev/null 2>&1 && brew doctor
#
# echo "Running brew update ............"
# which brew >/dev/null 2>&1 && brew update
#
# echo "OK, Running brew upgrade ............."
# brew upgrade --all
#
# echo "Tapping the homebrew/bundle"
# brew tap homebrew/bundle
#
# echo "Installing fomulas by using Budle .........."
# brew bundle --file=~/Brewfile



#####################################
# Symbolic Links
#####################################
echo "Create Symbolic Links .............."
DOT_DIRECTORY="${HOME}/dotfiles"
CONFIG_DIRECTORY="${DOT_DIRECTORY}/.config"
XDG_CONFIG_HOME="${HOME}/.config"

# $HOME/.configがなければ作る
mkdir -p $XDG_CONFIG_HOME 2>/dev/null
cd ${DOT_DIRECTORY}


__dot_link() {
    dotfile="${DOT_DIRECTORY}/$1"
    linkfile="${HOME}/$1"
    if [ -e $dotfile ]; then
        ln -snfv $dotfile $linkfile
    else
        echo "ファイルが存在していません"
    fi
}

__fish_link() {
    local FISH_DIR="${CONFIG_DIRECTORY}/fish"
    cd ${FISH_DIR}
    # $XDG_CONFIG_HOME/fishを作成
    mkdir -p ${XDG_CONFIG_HOME}/fish 2>/dev/null
    for f in *; do
        ln -snfv ${FISH_DIR}/${f} ${XDG_CONFIG_HOME}/fish/${f}
    done
}

__dir_link() {
    ln -snfv ${dotdir} "${XDG_CONFIG_HOME}/$1"
}

__config_link() {
    cd ${CONFIG_DIRECTORY}
    for d in *; do
        dotdir="${CONFIG_DIRECTORY}/${d}"
        if [ -e $dotdir ]; then
            if [ ${d} = "fish" ]; then
                __fish_link
            else
                __dir_link ${d}
            fi
        else
            echo "ファイルが存在していません"
        fi
    done
}

for f in * .*; do
    basename=$(basename "$f")
    if [ ${basename} = "." ] || [ ${basename} = ".." ] || [ ${basename##*.} = "sh" ] || [ ${basename##*.} = "md" ] || [ ${basename} = ".git" ] || [ ${basename} = ".gitignore" ] || [ ${basename} = "com.googlecode.iterm2.plist" ]; then
        :
    elif [ ${basename} = ".config" ]; then
        __config_link
    else
        __dot_link ${basename}
    fi
done 
