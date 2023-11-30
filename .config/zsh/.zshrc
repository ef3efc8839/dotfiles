autoload -U colors && colors
PROMPT='%F{red}%n@%F{white}%m:%~%f$> '

HISTFILE=/tmp/histfile
HISTSIZE=1000
SAVEHIST=1000

export VISUAL=nvim

stty -ixon

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

zmodload zsh/complist
compinit
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
alias ls="exa --color=auto"
alias ll="exa -al --color=auto"
alias tree="exa -T --level=2 --color=auto"
alias trans="trans :ru"
alias nsx="nsxiv -t ."

# exa
export EXA_COLORS="\
da=38;5;245:\
di=38;5;160:\
sn=38;5;28:\
sb=38;5;28:\
uu=38;5;40:\
un=38;5;110:\
gu=38;5;20:\
gn=38:5:160:\
bl=38;5;220:\
ur=37:\
uw=37:\
ux=37:\
ue=37:\
gr=37:\
gw=37:\
gx=37:\
tr=37:\
tw=37:\
tx=37:\
su=37:\
sf=37:\
xa=37"

#export STEAM_RUNTIME_PREFER_HOST_LIBRARIES=0
