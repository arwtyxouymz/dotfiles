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

if command -v phpbrew 1>/dev/null 2>&1; then
  source $HOME/.phpbrew/bashrc
fi
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)";
fi
if which pyenv-virtualenv-init > /dev/null; then
    eval "$(pyenv virtualenv-init -)";
fi

export PYTHONPATH="/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Resources/Python"
# exec fish
