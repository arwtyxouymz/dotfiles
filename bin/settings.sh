############################################
# Ricty for Powerline font
############################################
echo $'\e[32mCopy Ritcy for Powerline font to Fonts directory\e[0m'
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf $HOME/Library/Fonts/
fc-cache -vf

############################################
# iTerm2 color Scheme
############################################
echo $'\e[32mGet iTerm2 color schemes\e[0m'
ghq get https://github.com/mbadolato/iTerm2-Color-Schemes.git # Darkside

############################################
# tmux preferences
############################################
echo $'\e[32mGet tmux powerline and plugins\e[0m'
ghq get https://github.com/erikw/tmux-powerline.git
ghq get https://github.com/tmux-plugins/tpm.git

############################################
# Finder preferences
############################################
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

############################################
# Install pip to system python
############################################
cd $HOME
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
/usr/bin/python2.7 $HOME/get-pip.py --user
rm $HOME/get-pip.py
$HOME/Library/Python/2.7/bin/pip2.7 install neovim --user
