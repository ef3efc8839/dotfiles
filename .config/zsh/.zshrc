autoload -U colors && colors
PROMPT='%F{red}%n@%F{white}%m:%~%f$> '

HISTFILE=/tmp/histfile
HISTSIZE=1000
SAVEHIST=1000
export VISUAL=nvim

stty -ixon

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload -F zsh/complist

_comp_options+=(globdots)	

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
alias zathura="zathura "$@" > /dev/null 2>&1"
