export PATH=/usr/lib/llvm-6.0/bin:$PATH
# export PYTHONPATH=/usr/lib/llvm-6.0/lib/python2.7/site-packages:$PYTHONPATH
export PATH=$HOME/.local/bin:$PATH

export XDG_CONFIG_HOME=$HOME/.config


#################### CUDA & CUDNN ####################
export CUDA_PATH=/usr/local/cuda
export PATH=$CUDA_PATH/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_PATH/lib64:$LD_LIBRARY_PATH

#################### ROS ####################

# source /opt/ros/kinetic/setup.bash
# source $HOME/work/PFN/catkin_ws/devel/setup.bash
# export CATKIN_WS=$HOME/work/PFN/catkin_ws
# alias cs="cd ~/work/PFN/catkin_ws/src"
# alias cb="catkin build && source ~/work/PFN/catkin_ws/devel/setup.bash"

source $HOME/work/lab/catkin_ws/devel/setup.bash
export CATKIN_WS=$HOME/work/lab/catkin_ws
alias cs="cd ~/work/lab/catkin_ws/src"
alias cb="catkin build && source ~/work/lab/catkin_ws/devel/setup.bash"

# source $HOME/work/examples/ros/ws_moveit/devel/setup.bash
# export CATKIN_WS=$HOME/work/examples/ros/ws_moveit
# alias cs="cd ~/work/examples/ros/ws_moveit/src"
# alias cb="catkin build && source ~/work/examples/ros/ws_moveit/devel/setup.bash"

#################### Powerline #########################
_update_ps1()
{
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

##################### percol ########################
#========history search=======
# 重複履歴を無視
export HISTCONTROL=ignoreboth:erasedups
#historyの保存の数を10000に
export HISTSIZE=10000

# settings for peco
_replace_by_history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | percol --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
bind -x '"\C-r": _replace_by_history'

cdls()
{
    \cd "$@" && ls -a
}

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

##################### pyenv ############################
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

##################### vimtex ############################
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket


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
alias gc="git commit -m "
