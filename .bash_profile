export PATH=/usr/local/llvm-7.0/bin:$PATH
# export PYTHONPATH=/usr/lib/llvm-6.0/lib/python2.7/site-packages:$PYTHONPATH
export PATH=$HOME/.local/bin:$PATH

export XDG_CONFIG_HOME=$HOME/.config


#################### CUDA & CUDNN ####################
export CUDA_PATH=/usr/local/cuda
export PATH=$CUDA_PATH/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_PATH/lib64:$LD_LIBRARY_PATH

#################### ROS ####################

source /opt/ros/melodic/setup.bash
export CATKIN_WS=$HOME/work/lab/catkin_ws
#source $CATKIN_WS/devel/setup.bash

#################### Powerline #########################
_update_ps1()
{
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

cdls()
{
    \cd "$@" && ls -a
}

#if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
#  source "${VIRTUAL_ENV}/bin/activate"
#fi

##################### pyenv ############################
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

##################### vimtex ############################
#export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket


##################### alias ############################
alias vi="nvim"
alias vim="nvim"
alias cd="cdls"
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
