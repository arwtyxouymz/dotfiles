
#################### ZPlug ####################
source $HOME/.zplug/init.zsh
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"

zplug "b4b4r07/enhancd", use:enhancd.sh


if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

#################### General ####################
export PATH=$HOME/.local/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config
export PATH=/usr/local/llvm-7.0/bin:$PATH

#################### CUDA & CUDNN ####################
export CUDA_PATH=/usr/local/cuda
export PATH=$CUDA_PATH/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_PATH/lib64:$LD_LIBRARY_PATH

#################### ROS ####################
# source /opt/ros/melodic/setup.zsh
export CATKIN_WS=$HOME/work/catkin_ws
# source $CATKIN_WS/devel/setup.zsh

#################### Powerline #########################
# powerline-daemon -q

#################### POWERLEVEL9K #########################
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(user dir dir_writable vcs ssh status)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv time date)


#################### Utils #########################
cdls()
{
    \cd "$@" && lsd -a
}

wifi_update() {
  printf "Password: "
  read -s PASSWORD
  echo
  cd ~/Drivers/backport-iwlwifi
  echo $PASSWORD | sudo -S make clean
  echo $PASSWORD | sudo -S make defconfig-iwlwifi-public
  echo $PASSWORD | sudo -S make -j8
  echo $PASSWORD | sudo -S make install
}

##################### Rust ############################
source $HOME/.cargo/env

##################### Go ############################
export GOPATH=$HOME/.golang
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH

##################### DockUI #########################
export LC_CTYPE=en_US.UTF-8

##################### NPM ############################
export PATH=$HOME/.npm-global/bin:$PATH

##################### Alias ############################
alias ..2="cd ../../"
alias ..3="cd ../../../"
alias sb="source ~/.bashrc"
alias sz="source ~/.zshrc"
alias vi="nvim"
alias vim="nvim"
alias ls="lsd"
alias l="lsd -l"
alias la="lsd -a"
alias lla="lsd -la"
alias lt="lsd --tree"
alias cd="cdls"
alias cdw="cd ~/work"
alias cdd="cd ~/dotfiles/"
alias cdn="cd ~/dotfiles/.config/nvim"
alias apud="sudo apt update"
alias apug="sudo apt upgrade"
alias apl="apt list --upgradable"
alias shutdown="sudo shutdown -h now"
alias reboot="sudo reboot"

alias ga="git add "
alias ga.="git add ."
alias gc="git commit"
alias gcm="git commit -m "
alias gmend="git commit --amend"
alias gs="git status"
alias gd="git diff"
alias gp="git push "
alias cs="cd $CATKIN_WS/src"
alias cb="catkin build"
alias ss="source $CATKIN_WS/devel/setup.zsh"

alias dc="docker-compose"
alias sudo="sudo -E "

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/ryutaro/.npm-global/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/ryutaro/.npm-global/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/ryutaro/.npm-global/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /home/ryutaro/.npm-global/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/ryutaro/.npm-global/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /home/ryutaro/.npm-global/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
