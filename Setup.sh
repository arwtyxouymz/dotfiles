#!/bin/bash

SECONDS=0
export PYTHON3=3.6.5
export PYTHON2=2.7.15
export PHP=7.1.11
DOT_DIRECTORY="$HOME/dotfiles"

source ${DOT_DIRECTORY}/bin/options.sh
check_arguments $@

source ${DOT_DIRECTORY}/bin/password.sh
get_password

# 標準pythonにpip
echo $PASSWORD | sudo -S easy_install pip

source ${DOT_DIRECTORY}/bin/symbolic.sh
source ${DOT_DIRECTORY}/bin/homebrew.sh
source $HOME/.bash_profile
source ${DOT_DIRECTORY}/bin/settings.sh
source ${DOT_DIRECTORY}/bin/pyenv.sh

if [ "$ALL_FLAG" = 1 ]; then
    source ${DOT_DIRECTORY}/bin/web.sh
    source ${DOT_DIRECTORY}/bin/itkvtk.sh
    exit
fi

if [ "$WEB_FLAG" = 1 ]; then
    source ${DOT_DIRECTORY}/bin/web.sh
fi

if [ "$ITKVTK_FLAG" = 1 ]; then
    source ${DOT_DIRECTORY}/bin/itkvtk.sh
fi

time=$SECONDS
echo "Finished in $time seconds"
