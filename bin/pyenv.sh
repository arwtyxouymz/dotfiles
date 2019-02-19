############################################
# pyenv + pyenv-virtualenv
############################################
echo -e '\e[32mSetting up the pyenv and pyenv-virtualenv .............\e[0m'
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
pyenv install ${PYTHON3}
pip install --upgrade pip
pyenv virtualenv ${PYTHON3} neovim3
pyenv activate neovim3
pip install --upgrade pip
pip3 install pynvim
pip3 install flake8
pyenv deactivate

pyenv install ${PYTHON2}
pip install --upgrade pip
pyenv virtualenv ${PYTHON2} neovim2
pyenv activate neovim2
pip install --upgrade pip
pip2 install pynvim
pip2 install flake8
pyenv deactivate
