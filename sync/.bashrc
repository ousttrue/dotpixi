#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias y='yazi'

export EDITOR="nvim"

PS1='[\u@\h \W]\$ '

export PROMPT_COMMAND='history -a; history -r'
