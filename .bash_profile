export LANG="ja_JP.UTF-8"

export XDG_CONFIG_HOME="$HOME/.config"

export PATH="/sbin"
export PATH="/usr/sbin:$PATH"
export PATH="/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$XDG_CONFIG_HOME/composer/vendor/bin:$PATH"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/Cellar/llvm/6.0.0/bin:$PATH"
export PATH="/usr/local/Cellar/mysql/5.7.22/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

source $HOME/.phpbrew/bashrc
exec fish
