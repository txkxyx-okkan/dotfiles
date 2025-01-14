# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# config
ZSH_THEME="wedisagree"
CASE_SENSITIVE="true"
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# plugin 
plugins=(git)

source $ZSH/oh-my-zsh.sh
