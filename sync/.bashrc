#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# http://iandeth.dyndns.org/mt/ian/archives/000651.html
function share_history {
  history -a
  history -c
  history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend
export HISTSIZE=9999

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias y='yazi'
alias w='w3m'
function p {
  cd $HOME/dotpixi
  v
}
alias world='sudo emerge --ask --verbose --update --deep --changed-use @world'

export EDITOR="nvim"

PS1='[\u@\h \W]\$ '

export PROMPT_COMMAND='history -a; history -r'

export FZF_DEFAULT_OPTS="--layout=reverse --preview-window down:70%"
export FZF_DEFAULT_COMMAND="fd --type f -H -E .git"
function gg {
  local arg=""
  if [ $# -gt 0 ]; then
    arg="-q $*"
  fi
  local selected=$(ghq list -p | fzf ${arg} --reverse +m)
  if [[ ${selected} =~ [^\s] ]]; then
    cd ${selected}
  fi
}

# export SDL_AUDIODRIVER=pulse

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

#
# prompt
#
# https://qiita.com/GunseiKPaseri/items/e594c8e261905e3d0281
# local DSPCOLOR="reset"
export LUA_PATH="$HOME/lua/?.lua;$HOME/lua/?/init.lua"
export HTTP_HOME='~/dotfiles/home.html'
export XDG_MUSIC_DIR=$HOME/Music
if [ -v MSYSTEM ]; then

  export XDG_DATA_HOME=$HOME/.local/share
  export XDG_CONFIG_HOME=$HOME/.config
  export XDG_MUSIC_DIR=$HOME//home/oustt/Music
  export XDG_CACHE_HOME=$HOME/.cache
  export XDG_STATE_HOME=$HOME/.local/state
  export MSYS=winsymlinks:nativestrict
  export GHQ_ROOT=$HOME/ghq

  if grep -qi msys2 /etc/os-release >/dev/null 2>&1; then
    PLATFORM=$MSYSTEM
    if [[ $MSYSTEM == "MSYS" ]]; then
      SYSTEM_COLOR="black"
      ICON=🦉
    elif [[ $MSYSTEM == "MINGW64" ]]; then
      SYSTEM_COLOR="yellow"
      ICON=🐐
    elif [[ $MSYSTEM == "UCRT64" ]]; then
      SYSTEM_COLOR="yellow"
      ICON=🛸
    elif [[ $MSYSTEM == "CLANG64" ]]; then
      SYSTEM_COLOR="yellow"
      ICON=🐉
    else
      SYSTEM_COLOR="gray"
      ICON=🥚
    fi
  else
    SYSTEM_COLOR="white"
    PLATFORM=MSYSGIT
    ICON=🍄
  fi
else
  if grep -qi "Arch Linux" /etc/os-release; then
    SYSTEM_COLOR="cyan"
    PLATFORM=LINUX
    DIST="arch"
    ICON=󰣇
  elif grep -qi "Ubuntu" /etc/os-release; then
    SYSTEM_COLOR="red"
    PLATFORM=LINUX
    DIST="ubunts"
    ICON=
  else
    SYSTEM_COLOR="green"
    PLATFORM=LINUX
    ICON=🐧
  fi

  BUILD_ROOT=${HOME}/build/gcc
  BUILD_ROOT_LIB=${BUILD_ROOT}/lib
  export LD_LIBRARY_PATH=${BUILD_ROOT_LIB}
  export PKG_CONFIG_PATH=${BUILD_ROOT_LIB}/pkgconfig
  export PYTHONPATH=${HOME}/prefix/lib/python3.10/site-packages

  if grep -qi microsoft /proc/version; then
    IS_WSL=1
    ICON=🚇
  fi
fi

#
# ANSI COLOR
#
F_BLACK='\e[30m'
F_RED='\e[31m'
F_GREEN='\e[32m'
F_YELLOW='\e[33m'
F_BLUE='\e[34m'
F_MAGENTA='\e[35m'
F_CYAN='\e[36m'
F_WHITE='\e[37m'
F_RGB='\e[38;2;'
F_256='\e[38;5;'
F_DEFAULT='\e[39m'

B_BLACK='\e[40m'
B_RED='\e[41m'
B_GREEN='\e[42m'
B_YELLOW='\e[43m'
B_BLUE='\e[44m'
B_MAGENTA='\e[45m'
B_CYAN='\e[46m'
B_WHITE='\e[47m'
B_RGB='\e[48;2;'
B_256='\e[48;5;'
B_DEFAULT='\e[49m'

#
# decoration
#
E_BOLD='\e[0m'
E_LIGHT='\e[1m'
E_ITALIC='\e[2m'
E_UNDERLINE='\e[3m'
E_BLINK='\e[4m'
E_HIBLINK='\e[5m'
E_REVERSE='\e[6m'
E_HIDE='\e[7m'
E_STRIKE='\e[8m'
E_STRIKE='\e[9m'

C256_RED="255;0;15m"
C256_GREEN="0;145;64m"
C256_YELLOW="250;191;20m"
C256_BLUE="0;0;255m"
C256_MAGENTA="146;7;131m"
C256_CYAN="0;160;233m"
C256_GRAY="229;229;229m"
C256_WHITE="255;255;255m"
C256_BLACK="0;0;0m"

B_CURRENT='\e[49m'

BG() {
  printf '\e[48;2;'$1
  B_CURRENT='\e[38;2;'$1
}

FG() {
  printf '\e[38;2;'$1
}

PL() {
  printf " ${B_CURRENT}"
  BG $2
  printf " "
  FG $1
}

PL_END() {
  printf " "
  FG ${B_CURRENT}
  printf '\e[49m'
}

FB() {
  FG $1
  BG $2
}

GetPwd() {
  local pwdInfo=$(pwd)
  if [[ "$pwdInfo" =~ ^.*/ghq/github.com/(.*)$ ]]; then
    printf " /${BASH_REMATCH[1]}"
  elif [[ "$pwdInfo" =~ ^"$HOME"(/|$) ]]; then
    printf "🏠${pwdInfo#$HOME}"
  else
    printf "📂${pwdInfo}"
  fi
}

ColorArrow() {
  if [ "$1" = "0" ]; then
    printf "${F_CYAN}>${F_DEFAULT}"
  else
    printf "${F_RED}>${F_DEFAULT}"
  fi
}

GetBranch() {
  if [[ "$(uname -r)" == *microsoft* && "$pwdInfo" =~ ^/mnt/ ]]; then
    # Git is too slow in WSLdir
    :
  else
    git branch --show-current 2>/dev/null
  fi
}

TmuxHeader() {
  FB ${C256_WHITE} ${C256_BLACK}
  printf ${ICON}

  PL ${C256_BLACK} ${C256_GRAY}
  printf $(GetPwd)

  local branch=$(GetBranch)
  if [ ! -z ${branch} ]; then
    local git_log=$(git log --pretty="format:%cr   %s" -n 1)
    tmux selectp -T" ${branch}   ${git_log}" -t $TMUX_PANE
  else
    tmux selectp -T"🎴" -t $TMUX_PANE
  fi

  PL_END
}

Header() {
  FB ${C256_WHITE} ${C256_BLACK}
  printf ${ICON}

  PL ${C256_BLACK} ${C256_GRAY}
  printf $(GetPwd)

  local branch=$(GetBranch)
  if [ ! -z ${branch} ]; then
    PL ${C256_RED} ${C256_YELLOW}
    printf " ${branch}"

    PL ${C256_BLUE} ${C256_WHITE}
    git log --pretty=format:%s -n 1

    PL ${C256_BLUE} ${C256_YELLOW}
    printf "status"
    # git status --ignore-submodules
  fi

  PL_END
}

Prompt() {
  share_history

  if [ -v TMUX ]; then
    if [ "$1" = "0" ]; then
      PS1="$(TmuxHeader)\n\[${F_CYAN}\]>\[${F_DEFAULT}\] "
    else
      PS1="$(TmuxHeader)\n\[${F_RED}\]>\[${F_DEFAULT}\] "
    fi
  else
    if [ "$1" = "0" ]; then
      PS1="$(Header)\n\[${F_CYAN}\]>\[${F_DEFAULT}\] "
    else
      PS1="$(Header)\n\[${F_RED}\]>\[${F_DEFAULT}\] "
    fi
  fi
}

PROMPT_COMMAND='Prompt $?'
