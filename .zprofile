export ZDOTDIR="$HOME/.config/zsh"
export PATH=$HOME/.local/bin:$PATH
export SUDO_ASKPASS=/usr/bin/pkexec
export XDG_RUNTIME_DIR=/run/user/$(id -u)

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
