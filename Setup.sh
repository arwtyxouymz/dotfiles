#!/bin/bash
export PYTHON3=3.6.5
export PYTHON2=2.7.15
export PHP=7.1.11

source ./bin/options.sh
check_arguments $@

source ./bin/password.sh
get_password

source ./bin/homebrew.sh
source ./bin/symbolic.sh
source $HOME/.bash_profile
source ./bin/settings.sh

if [ "$ALL_FLAG" = 1 ]; then
    source ./bin/web.sh
    source ./bin/itkvtk.sh
    exit
fi

if [ "$WEB_FLAG" = 1 ]; then
    source ./bin/web.sh
fi

if [ "$ITKVTK_FLAG" = 1 ]; then
    source ./bin/itkvtk.sh
fi
