#!/usr/bin/env bash

if ! is_exists pyenv; then
    log_error "Failed to setup pyenv: Command not found"
    exit
fi

eval "$(pyenv init -)";
eval "$(pyenv virtualenv-init -)";

PYTHON3_VERSION=3.8.2
PYTHON2_VERSION=2.7.15

pyenv install ${PYTHON3_VERSION}
pyenv install ${PYTHON2_VERSION}

########################################################
# neovim3
########################################################
pyenv virtualenv ${PYTHON3_VERSION} neovim3
pyenv activate neovim3
pip install --upgrade pip
pip install pynvim
pyenv deactivate

########################################################
# neovim2
########################################################
pyenv virtualenv ${PYTHON2_VERSION} neovim2
pyenv activate neovim2
pip install --upgrade pip
pip install pynvim
pyenv deactivate
