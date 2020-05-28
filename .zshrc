# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export TERM=xterm-256color

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Python path
export PYTHONPATH=$HOME/.pyenv/versions/3.8.1/lib/python3.8/site-packages

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    fzf
    sudo
    zsh-256color
    h
    forgit
    zsh-autosuggestions
    zsh-interactive-cd
    emoji-cli
    fast-syntax-highlighting
    up
    tmux
    pip
    zsh-wakatime
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# My-aliases
alias zshrc="nvim ~/.zshrc"
alias et="nvim ~/.tmux.conf"
alias sz="source ~/.zshrc"

alias vimrc="vim ~/.vimrc"
alias nvimrc="nvim ~/.config/nvim/init.vim"
alias etp="nvim ~/.tmux-powerline/themes/default.sh"

alias dev="cd /mnt/c/Users/Neobby_Dev/DevOps"
alias share="cd /mnt/c/Users/Neobby_Dev/wsl_share"
alias deactivate="pyenv deactivate"
alias deact="pyenv deactivate"

alias -g gp="| grep -i"
alias v="nvim"

# Many mistake keys
alias cl="clear"
alias celar="clear"
alias cle="clear"
alias claer="clear"
alias clera="clear"
alias sl="ls"

# Only display Username
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "🔥 %(!.%{%F{white}.%})$USER"
  fi
}

# virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=0

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Autoenv
export AUTOENV_ENABLE_LEAVE='"enabled"'
source ~/.autoenv/activate.sh

# LS color scheme
export LS_COLORS="$(vivid generate molokai)"

# the fuck
eval $(thefuck --alias)

# dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# Fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# X11
export DISPLAY=:0

# Tmux autoRun
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

# pip AutoComplete
eval "`pip completion --zsh`"
compctl -K _pip_completion pip3
