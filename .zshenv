#################################################
# zplug
#################################################
source $HOME/.zplug/init.zsh

zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-autosuggestions'

#Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

#################################################
# Options
#################################################
autoload -Uz colors && colors
autoload -Uz compinit && compinit

# 補完候補がない場合にビープ音を鳴らさない
setopt no_beep
# シェルのプロセス間で履歴を共有
setopt share_history
# 重複したヒストリは追加しない
setopt hist_ignore_all_dups
# 複数のzshを使うときにhistoryファイルに上書きせずに追加
setopt append_history
# cdしたらpushd
setopt auto_pushd
# 補完候補が複数ある時に，一覧表示
setopt auto_list
# 補完候補が複数ある時に自動的に一覧表示
setopt auto_menu
# コマンドをtypoした時に聞き直してくれる
setopt correct
# =の後のパスとかも補完
setopt magic_equal_subst
# カッコの対応を自動で補完
setopt auto_param_keys

#################################################
# Styles
#################################################
# 大文字入力をした時以外は大文字小文字を区別しないで補完する
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

#################################################
# ENVs
#################################################
export XDG_CONFIG_HOME=$HOME/.config
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/go/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export RUST_BACKTRACE=1

#################################################
# Initialization
#################################################
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)";
    eval "$(pyenv virtualenv-init -)";
fi

eval "$(starship init zsh)"

#################################################
# Functions
#################################################
cdls()
{
    \cd "$@" && exa -a
}

#################################################
# Command alternation
#################################################
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

#################################################
# Useful aliases
#################################################
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
