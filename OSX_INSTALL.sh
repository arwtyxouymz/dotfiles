#!/bin/bash

echo "Installing the CommandLineTools"
xcode-select --install

echo "Create Symbolic Links .............."
sh ./SymLink.sh

echo "Installing homebrew ............"
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Running brew doctor ............"
which brew >/dev/null 2>&1 && brew doctor

echo "Running brew update ............"
which brew >/dev/null 2>&1 && brew update

echo "OK, Running brew upgrade ............."
brew upgrade --all

echo "Tapping the homebrew/bundle"
brew tap homebrew/bundle

echo "Installing fomulas by using Budle .........."
brew bundle --file=~/Brewfile

