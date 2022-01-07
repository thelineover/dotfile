export ZSH="/home/dev-x1c/.oh-my-zsh"

plugins=(git fast-syntax-highlighting zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
export NVM_DIR="/home/dev-x1c/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# TMUX
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t Focal || tmux new -s Focal
fi

# ROS
source /opt/ros/noetic/setup.zsh
source ~/catkin_ws/devel/setup.zsh

# ROS Network
export ROS_HOSTNAME=192.168.70.47
export ROS_MASTER_URI=http://192.168.70.42:11311

# ROS EDITOR
export EDITOR='nvim'

# ROS alias
alias cw='cd ~/catkin_ws'
alias cs='cd ~/catkin_ws/src'
alias cm='cd ~/catkin_ws && catkin_make'

# Alias
alias zshrc='vim ~/.zshrc'
alias sz='source ~/.zshrc'
alias nvimrc='vim ~/.config/nvim/init.vim'
alias tmuxrc='vim ~/.tmux.conf'
alias vim='nvim'
alias v='nvim'

alias cl='clear'
alias lc='clear'
alias cle='clear'
alias clea='clear'
alias claer='clear'
alias clere='clear'
alias clera='clear'
alias clare='clear'
alias dlaer='clear'
alias lcear='clear'
alias celar='clear'
alias cleawr='clear'
alias celra='clear'

alias lss='ls'
alias sl='ls'
alias lsd='ls'
alias sls='ls'

# Dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Starship
eval "$(starship init zsh)"
