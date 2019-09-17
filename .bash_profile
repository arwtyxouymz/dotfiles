export PATH=$HOME/.local/bin:$PATH
export XDG_CONFIG_HOME=$HOME/.config


#################### CUDA & CUDNN ####################
export CUDA_PATH=/usr/local/cuda
export PATH=$CUDA_PATH/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_PATH/lib64:$LD_LIBRARY_PATH

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
export PATH="$HOME/.cargo/bin:$PATH"

##################### alias ############################
alias sb="source ~/.bashrc"
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
alias ss="source $CATKIN_WS/devel/setup.bash"

alias dc="docker-compose"
alias sudo="sudo -E "
