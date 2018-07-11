############################################
# HomeBrew setup
############################################
echo $'\e[32mInstalling homebrew ............\e[0m'
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo $'\e[32mRunning brew doctor ............\e[0m'
which brew >/dev/null 2>&1 && brew doctor

echo $'\e[32mRunning brew update ............\e[0m'
which brew >/dev/null 2>&1 && brew update

echo $'\e[32mOK, Running brew upgrade .............\e[0m'
brew upgrade

############################################
# HomeBrew file
############################################
echo $'\e[32mGetting the packages .............\e[0m'
# for password input
brew tap homebrew/cask
brew cask install iterm2
# for brew file
brew install argon/mas/mas
brew install rcmdnk/file/brew-file
XCODE=`mas search xcode | cut -d' ' -f1 | xargs | cut -d' ' -f1`
mas install ${XCODE}
sudo xcodebuild -license accept
brew file install

############################################
# HomeBrew Services
############################################
brew services start rtags
