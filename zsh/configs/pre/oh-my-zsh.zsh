# visuals
set -o vi
export VISUAL=vim
export EDITOR="$VISUAL"
export TERM=xterm-256color

# theme setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"
plugins=(
    fzf
)
SPACESHIP_VI_MODE_SHOW=false
source $ZSH/oh-my-zsh.sh