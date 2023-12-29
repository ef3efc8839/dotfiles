export ZDOTDIR="$HOME/.config/zsh"
export PATH=$HOME/.local/bin:$PATH
export XDG_RUNTIME_DIR=/run/user/$(id -u)

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
