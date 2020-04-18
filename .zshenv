eval "$(starship init zsh)"

# Options
setopt share_history
setopt histignorealldups
setopt correct

autoload -Uz colors
colors

autoload -Uz cominit
compinit

# PATHs
export XDG_CONFIG_HOME=$HOME/.config
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/go/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export RUST_BACKTRACE=1

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)";
    eval "$(pyenv virtualenv-init -)";
fi

# Functions
cdls()
{
    \cd "$@" && ls -a
}

# Command alternation
alias vi="nvim"
alias vim="nvim"
alias cat="bat"
alias ls="exa"
alias find="fd"
alias grep="rg"
alias ps="procs"
alias top="ytop"
alias hex="hexyl"
alias cd="cdls"

# Some useful alias
alias ss="source ~/.zshenv"
alias l="ls -l"
alias l1="ls -1"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"
alias cdw="cd ~/work"
alias cdd="cd ~/dotfiles/"
alias cdn="cd ~/dotfiles/.config/nvim"

alias ga="git add "
alias ga.="git add ."
alias gc="git commit"
alias gcm="git commit -m "
alias gmend="git commit --amend"
alias gs="git status"
alias gd="git diff"
alias gp="git push "

alias dc="docker-compose"
alias sudo="sudo -E "
