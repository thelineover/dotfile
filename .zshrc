# Path to your oh-my-zsh installation.
export ZSH="/Users/thelineover/.oh-my-zsh"
export PATH="/opt/homebrew/bin:$PATH"

# Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting up)

source $ZSH/oh-my-zsh.sh

# User configuration
alias zshrc='nvim ~/.zshrc'
alias nvimrc='nvim ~/.config/nvim/init.vim'
alias tmuxrc='nvim ~/.tmux.conf'
alias sz='source ~/.zshrc'
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
alias celaer='clear'

alias ls='exa'
alias lss='ls'
alias sl='ls'
alias lsd='ls'
alias sls='ls'

# Dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Starship
eval "$(starship init zsh)"

# TMUX
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t M1pro || tmux new -s M1pro
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

