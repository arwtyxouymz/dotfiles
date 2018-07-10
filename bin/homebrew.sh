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
brew install argon/mas/mas
brew install rcmdnk/file/brew-file
brew file install
# これ以降にhomebrewのパッケージを追加

############################################
# HomeBrew Services
############################################
brew services start rtags
