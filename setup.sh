#!/bin/bash

SECONDS=0
export PYTHON3=3.6.7
export PYTHON2=2.7.15
DOT_DIRECTORY=$HOME/dotfiles

source ${DOT_DIRECTORY}/bin/options.sh
check_arguments $@

source ${DOT_DIRECTORY}/bin/password.sh
get_password

source ${DOT_DIRECTORY}/bin/packages.sh
source ${DOT_DIRECTORY}/bin/symbolic.sh
source ${DOT_DIRECTORY}/bin/homebrew.sh
source $HOME/.bash_profile
source ${DOT_DIRECTORY}/bin/pyenv.sh

time=$SECONDS
echo "Finished in $time seconds"
