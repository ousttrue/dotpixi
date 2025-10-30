#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias y='yazi'
function p {
  cd $HOME/dotpixi
  v
}

export EDITOR="nvim"

PS1='[\u@\h \W]\$ '

export PROMPT_COMMAND='history -a; history -r'

if which zoxide > /dev/null; then
   eval "$(zoxide init bash)"
fi

export FZF_DEFAULT_OPTS="--layout=reverse --preview-window down:70%"
export FZF_DEFAULT_COMMAND="fd --type f -H -E .git"
function gg {
  local arg=""
  if [ $# -gt 0 ]; then
    arg="-q $*"
  fi
  local selected=$(ghq list -p | fzf ${arg} --reverse +m)
  if [[ ${selected} =~ [^\s] ]]; then
    z ${selected}
  fi
}

export SDL_AUDIODRIVER=jack

function fpac {
  local selected=$(pacman -Sl | cut -d " " -f 2 | fzf --preview "pacman -Si {}")
  if [[ ${selected} =~ [^\s] ]]; then
    sudo pacman -S ${selected}
  fi
}

function fapt {
  local selected=$(apt list | cut -d "/" -f 1 | fzf --preview "apt-cache show {}")
  if [[ ${selected} =~ [^\s] ]]; then
    sudo apt install ${selected}
  fi
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Created by `pipx` on 2025-07-27 06:39:41
export PATH="$PATH:/home/ousttrue/.local/bin"

