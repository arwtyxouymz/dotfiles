#!/usr/bin/env bash

brew update && brew upgrade
brew cask upgrade

# shell
brew install zsh
brew install starship

# GUI tools
brew cask install alfred
brew cask install iterm2
brew cask install alt-tab
brew cask install google-chrome

# commands
brew install git
brew install bat
brew install exa
brew install fd
brew install ripgrep
brew install procs
brew tap cjbassi/ytop
brew install ytop
brew install hexyl

# languages
brew install node
brew install yarn
brew install go
brew install pyenv pyenv-virtualenv

# Finally
brew cleanup
