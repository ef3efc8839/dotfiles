autoload -U colors && colors
PROMPT='%F{red}%n@%F{white}%m:%~%f$> '

HISTFILE=/tmp/histfile
HISTSIZE=1000
SAVEHIST=1000

stty -ixon

# Autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload -F zsh/complist

_comp_options+=(globdots)	

# Default programs
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="st-256color"
export TERMINAL_PROG="st-256color"
export BROWSER="firefox"

# Vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Alias
alias ls="eza --color=auto"
alias ll="eza -al --color=auto"
alias tree="eza -T --level=2 --color=auto"
alias nsx="nsxiv --thumbnail ."
alias py="python"
