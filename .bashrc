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

source ~/.config/lf/lf.bash
