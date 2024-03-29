#!/usr/bin/env bash

brew update && brew upgrade
brew cask upgrade

# shell
brew install zsh
brew install fzf
brew install starship
brew install git

# GUI tools
brew cask install alfred
brew cask install iterm2
brew cask install alt-tab
brew cask install google-chrome
brew cask install notion

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
brew install git-delta

# languages
brew install node
brew install yarn
brew install deno
brew install go
brew install pyenv pyenv-virtualenv

# Others
brew tap homebrew/cask-fonts
brew cask install font-fira-code-nerd-font

# Finally
brew cleanup
