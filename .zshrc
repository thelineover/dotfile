# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export TERM=xterm-256color
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# My-aliases
alias ez="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
alias et="vim ~/.tmux.conf"
alias vimrc="vim ~/.vimrc"
alias nvimrc="nvim ~/.config/nvim/init.vim"
alias cl="clear"
alias dev="cd /mnt/c/Users/Neobby_Dev/DevOps"
alias deactivate="pyenv deactivate"
alias -g gp="| grep -i"
alias vim="nvim"
alias celar="clear"

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "🔥 %(!.%{%F{blue}.%})$USER"
  fi
}

# virtualenv
export VIRTUAL_ENV_DISABLE_PROMPT=0

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Autoenv
export AUTOENV_ENABLE_LEAVE='"enabled"'
source ~/.autoenv/activate.sh

# LS color scheme
export LS_COLORS="$(vivid generate molokai)"

# the fuck
eval $(thefuck --alias)

# dotfile
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

