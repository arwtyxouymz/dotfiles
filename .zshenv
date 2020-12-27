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
autoload -Uz bashcompinit && bashcompinit

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
# For M1 Mac
typeset -U path PATH
export ARCH=`uname -m`
path=(
    /opt/homebrew/bin(N-/)
    /usr/local/bin(N-/)
    $path
)
if [[ "${(L)$( uname -s )}" == darwin ]] && (( $+commands[arch] )); then
    alias brew="arch -arch x86_64 /usr/local/bin/brew"
    alias x64='exec arch -arch x86_64 "$SHELL"'
    alias a64='exec arch -arch arm64e "$SHELL"'
    switch-arch() {
    if  [[ "$(uname -m)" == arm64 ]]; then
        x64
    elif [[ "$(uname -m)" == x86_64 ]]; then
        a64
    fi
    exec arch -arch $arch "$SHELL"
}
fi
setopt magic_equal_subst

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

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/tools/flutter/bin:$PATH
export PATH=/usr/local/Cellar/postgresql@9.6/9.6.21/bin:$PATH
export PATH=/usr/local/opt/openjdk/bin:$PATH
export PATH=/usr/local/opt/mysql-client/bin:$PATH
export PATH=$PATH:/Users/ryutaro.matsumoto/Library/Android/sdk/platform-tools
export PATH=/usr/local/opt/openjdk/bin:$PATH
#export PATH=$HOME/go/bin:$PATH
#export PATH=$HOME/tools/flutter/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export RUST_BACKTRACE=1

export CPPFLAGS="-I/usr/local/opt/openjdk/include"

#################################################
# Complete
#################################################
complete -C '/usr/local/bin/aws_completer' aws

#################################################
# Functions
#################################################
function cdls()
{
    \cd "$@" && lsd -a
}

function copy()
{
    \cat "$@" | pbcopy
}

function staas()
{
    cluster=$1
    case ${cluster} in
        jpe2b) endpoint="https://jpe2b-1000-staas.r-local.net/" ;;
        euc1a) endpoint="https://euc1a-1000-staas.r-local.net/" ;;
        usw1a) endpoint="https://usw1a-1000-staas.r-local.net/" ;;
        *)
            echo "Invalid cluster"
            return 1
            ;;
    esac
    aws --endpoint-url ${endpoint} s3 ${@:2}
}

#################################################
# Command alternation
#################################################
alias vi="nvim"
alias vim="nvim"
alias cat="bat"
alias ls="lsd"
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
alias gb="git branch"
alias gc="git commit"
alias gcm="git commit -m "
alias gmend="git commit --amend"
alias gs="git status"
alias gd="git diff"
alias gp="git push "
alias gsw="git switch"

alias dc="docker compose"
alias sudo="sudo -E "
alias k="kubectl"
. "$HOME/.cargo/env"
