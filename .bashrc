#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls --color=auto -a'
alias mkpryc='mkdir -p images && touch Makefile && cp ~/Documents/C/main.c main.c'
alias grep='grep --color=auto'


#Uncomment to use pywal
# (cat ~/.cache/wal/sequences &)

echo "I use arch btw..."
export PS1="\[\e]133;k;start_kitty\a\]\[\e]133;A\a\]\[\e]133;k;end_kitty\a\]\e[0;31m \u\e[0m \e[0;35m\W >\e[0m \[\e]133;k;start_suffix_kitty\a\]\[\e[5 q\]\[\e]2;\w\a\]\[\e]133;k;end_suffix_kitty\a\]"
PATH=/home/notsy/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl/:/usr/local/texlive/2024/bin/x86_64-linux/:~/.config/rofi/scripts

