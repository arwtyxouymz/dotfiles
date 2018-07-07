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
ghq get git@github.com:mbadolato/iTerm2-Color-Schemes.git # Darkside

############################################
# tmux preferences
############################################
echo $'\e[32mGet tmux powerline and plugins\e[0m'
ghq get git@github.com:erikw/tmux-powerline.git
ghq get git@github.com:tmux-plugins/tpm.git
