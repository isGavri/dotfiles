#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias la='ls --color=auto -a'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias wh='dbus-run-session Hyprland'

PS1='[\u@\h \W]\$ '

export PATH=$PATH:/home/notsy/dotfiles/scripts/

. "$HOME/.cargo/env"


function yy() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

