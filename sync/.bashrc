#!/usr/bin/bash
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

if which lsd >/dev/null; then
  alias ls='lsd'
else
  alias ls='ls --color=auto'
fi
alias grep='grep --color=auto'
alias v='nvim'
alias y='yazi'
alias w='w3m'
function p {
  cd $HOME/dotpixi
  v
}

function ptouch {
  mkdir -p "$(dirname "$1")" && touch "$1"
}

export EDITOR="nvim"

export FZF_DEFAULT_OPTS="--layout=reverse --preview-window down:70%:wrap"
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
function gs {
  local selected=$(git branch | fzf)
  if [[ ${selected} =~ [^\s] ]]; then
    git switch $selected
  fi
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Created by `pipx` on 2025-07-27 06:39:41
export PATH="$PATH:/home/ousttrue/.local/bin"
export PATH="$PATH:/home/ousttrue/local/bin"

#
# prompt
#
# https://qiita.com/GunseiKPaseri/items/e594c8e261905e3d0281
# local DSPCOLOR="reset"
export LUA_PATH="$HOME/lua/?.lua;$HOME/lua/?/init.lua"
export HTTP_HOME='~/.w3m/bookmark.html'
export XDG_DATA_DIRS="${HOME}/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"
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
      SYSTEM_COLOR="BLACK"
      ICON="🦉"
    elif [[ $MSYSTEM == "MINGW64" ]]; then
      SYSTEM_COLOR="YELLOW"
      ICON="🐐"
    elif [[ $MSYSTEM == "UCRT64" ]]; then
      SYSTEM_COLOR="YELLOW"
      ICON="🛸"
    elif [[ $MSYSTEM == "CLANG64" ]]; then
      SYSTEM_COLOR="YELLOW"
      ICON="🐉"
    else
      SYSTEM_COLOR="GRAY"
      ICON="🥚"
    fi
  else
    SYSTEM_COLOR="WHITE"
    PLATFORM=MSYSGIT
    ICON="🍄"
  fi
else
  if grep -qi "Arch Linux" /etc/os-release; then
    SYSTEM_COLOR="CYAN"
    PLATFORM=LINUX
    DIST="arch"
    ICON="󰣇 "

    alias world='sudo pacman -Syu'
    function pfz {
      local selected=$(pacman -Sl | cut -d " " -f 2 | fzf --preview "pacman -Si {}")
      if [[ ${selected} =~ [^\s] ]]; then
        sudo pacman -S ${selected}
      fi
    }
    function prm {
      local selected=$(pacman -Qs -q | fzf --preview "pacman -Si {}")

      if [[ ${selected} =~ [^\s] ]]; then
        sudo pacman -Rcns ${selected}
      fi
    }

  elif grep -qi "Ubuntu" /etc/os-release; then
    SYSTEM_COLOR="RED"
    PLATFORM=LINUX
    DIST="ubunts"
    ICON=" "

    function afz {
      local selected=$(apt list | cut -d "/" -f 1 | fzf --preview "apt-cache show {}")
      if [[ ${selected} =~ [^\s] ]]; then
        sudo apt install ${selected}
      fi
    }

  elif grep -qi "Gentoo" /etc/os-release; then
    SYSTEM_COLOR="MAGENTA"
    PLATFORM=LINUX
    DIST="gentoo"
    ICON=" "

    alias world='sudo emerge --ask --verbose --update --deep --changed-use @world'
    alias etcup='sudo etc-update --automode -3'

    function efz {
      pushd /var/db/repos/gentoo
      local selected=$(find * -mindepth 1 -maxdepth 1 -type d | fzf --preview "eix -e --color=always {}")
      popd
      if [[ ${selected} =~ [^\s] ]]; then
        sudo emerge -av --autounmask=y --autounmask-license=y --autounmask-write=y ${selected}
      fi
    }
    function erm {
      local selected=$(eix-installed -a | sed -r 's/-[^-]+(-r[0-9]+)*$//' | fzf --preview "eix -e --color=always {}")
      if [[ ${selected} =~ [^\s] ]]; then
        sudo emerge --deselect ${selected}
      fi
    }

  else
    SYSTEM_COLOR="GREEN"
    PLATFORM=LINUX
    ICON=" "
  fi

  BUILD_ROOT=${HOME}/build/gcc
  BUILD_ROOT_LIB=${BUILD_ROOT}/lib
  export LD_LIBRARY_PATH=${BUILD_ROOT_LIB}
  export PKG_CONFIG_PATH=${BUILD_ROOT_LIB}/pkgconfig
  # export PYTHONPATH=${HOME}/prefix/lib/python3.10/site-packages

  if grep -qi microsoft /proc/version; then
    SYSTEM_COLOR="BLUE"
    IS_WSL=1
    # ICON="󰻀 "
  fi
fi

#
# decoration
#
# CSI='\e['
# OSI='\033]'

SGR() {
  case $1 in
  'RESET') printf '\e[0m' ;;
  'BOLD') printf '\e[1m' ;;
  'LIGHT') printf '\e[2m' ;;
  'ITALIC') printf '\e[3m' ;;
  'UNDERLINE') printf '\e[4m' ;;
  'BLINK') printf '\e[5m' ;;
  'HIBLINK') printf '\e[6m' ;;
  'REVERSE') printf '\e[7m' ;;
  'HIDE') printf '\e[8m' ;;
  'STRIKE') printf '\e[9m' ;;
  esac
}

B_CURRENT='DEFAULT'
# FG => GRAY, BG=> WHITE

BG() {
  B_CURRENT=$1
  case $1 in
  'GRAY') printf '\[\e[40m\]' ;;
  'RED') printf '\[\e[41m\]' ;;
  'GREEN') printf '\[\e[42m\]' ;;
  'YELLOW') printf '\[\e[43m\]' ;;
  'BLUE') printf '\[\e[44m\]' ;;
  'MAGENTA') printf '\[\e[45m\]' ;;
  'CYAN') printf '\[\e[46m\]' ;;
  'WHITE') printf '\[\e[47m\]' ;;
  'DEFAULT') printf '\[\e[49m\]' ;;
  'BLACK') printf '\[\e[100m\]' ;;
  *) printf "BG($1)" ;;
  esac
  # bright 100-109
}

FG() {
  # bright 90-99
  case $1 in
  'GRAY') printf '\[\e[30m\]' ;;
  'RED') printf '\[\e[31m\]' ;;
  'GREEN') printf '\[\e[32m\]' ;;
  'YELLOW') printf '\[\e[33m\]' ;;
  'BLUE') printf '\[\e[34m\]' ;;
  'MAGENTA') printf '\[\e[35m\]' ;;
  'CYAN') printf '\[\e[36m\]' ;;
  'WHITE') printf '\[\e[37m\]' ;;
  'DEFAULT') printf '\[\e[39m\]' ;;
  'BLACK') printf '\[\e[90m\]' ;;
  *) printf "FG($1)" ;;
  esac
}

PL() {
  if [ $2 = $B_CURRENT ]; then
    printf " > "
  else
    if [ $B_CURRENT = "DEFAULT" ]; then
      FG "GRAY"
    else
      FG ${B_CURRENT}
    fi
    printf " "
    BG $2
    printf " "
    FG $1
  fi
}

PL_END() {
  FG ${B_CURRENT}
  printf " "
  BG "DEFAULT"
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
    printf "${pwdInfo}"
  fi
}

ColorArrow() {
  if [ "$1" = "0" ]; then
    printf "$(FG CYAN)>$(FG DEFAULT)"
  else
    printf "$(FG RED)>$(FG DEFAULT)"
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

# TmuxHeader() {
#   FB "WHITE" "BLACK"
#   printf ${ICON}
#
#   PL "BLACK" "GRAY"
#   printf $(GetPwd)
#
#   local branch=$(GetBranch)
#   if [ ! -z ${branch} ]; then
#     local git_log=$(git log --pretty="format:%cr   %s" -n 1)
#     tmux selectp -T" ${branch}   ${git_log}" -t $TMUX_PANE
#   else
#     tmux selectp -T"🎴" -t $TMUX_PANE
#   fi
#
#   PL_END
# }

OSC() {
  if [ -n $3 ]; then
    printf '\[\e]$1;$2;$3\a\]'
  else
    printf '\[\e]$1;$2\a\]'
  fi
}

Header() {
  if [ -n $1 ]; then
    OSC 133 D $1
  fi
  OSC 7 "file://$HOSTNAME/$PWD"

  FB "${SYSTEM_COLOR}" "DEFAULT"
  printf "${ICON}"

  FG "DEFAULT"
  printf " > $(GetPwd)"

  local branch=$(GetBranch)
  if [ ! -z ${branch} ]; then
    PL "RED" "YELLOW"
    printf " ${branch}"

    PL "BLUE" "WHITE"
    git log --pretty=format:%s -n 1

    # PL "BLUE" "YELLOW"
    # printf "status"
    # git status --ignore-submodules
  fi

  PL ${B_CURRENT} "DEFAULT"
  # PL_END
}

# OSC133 https://gitlab.freedesktop.org/Per_Bothner/specifications/blob/master/proposals/semantic-prompts.md
#
# A(prompt)B(user_input)C
# (command_output)
# D
Prompt() {
  share_history

  PA='\[\e[30m\]■\[\e[31m\]■\[\e[32m\]■\[\e[33m\]■\[\e[34m\]■\[\e[35m\]■\[\e[36m\]■\[\e[37m\]■'
  PB='\[\e[90m\]■\[\e[91m\]■\[\e[92m\]■\[\e[93m\]■\[\e[94m\]■\[\e[95m\]■\[\e[96m\]■\[\e[97m\]■'
  CLR='\[\e[0m\]'
  if [ "$1" = "0" ]; then
    PS1="(${CLR}${PA}${CLR} ${PB}${CLR})$(Header 0)\n$(FG CYAN)$(OSC 133 A)>$(FG DEFAULT)$(OSC 133 B) "
  else
    PS1="(${CLR}${PA}${CLR} ${PB}${CLR})$(Header 1)\n$(FG RED)$(OSC 133 A)>$(FG DEFAULT)$(OSC 133 B) "
  fi

  # if [ -v TMUX ]; then
  #   if [ "$1" = "0" ]; then
  #     PS1="$(TmuxHeader)\n\[$(FG CYAN)\]>\[$(FG DEFAULT)\] "
  #   else
  #     PS1="$(TmuxHeader)\n\[$(FG RED)\]>\[$(FG DEFAULT)\] "
  #   fi
  # else
  # printf '\e]133;A\e\\'
  #
  # fi
}

# PS1='[\u@\h \W]\$ '
# export PROMPT_COMMAND='history -a; history -r'
if [ "$TERM" != "linux" ]; then
  PROMPT_COMMAND='Prompt $?'
fi

ANSI_COLORS=(
  "       Black  "
  "       Red    "
  "       Green  "
  "       Yellow "
  "       Blue   "
  "       Magenta"
  "       Cyan   "
  "       White  "
)
LIGHT_COLORS=(
  " Light Black  "
  " Light Red    "
  " Light Green  "
  " Light Yellow "
  " Light Blue   "
  " Light Magenta"
  " Light Cyan   "
  " Light White  "
)
# Background colors
function palette {
  echo -e "\
FG\\BG \
  49:default  \
  40:black    \
  47:white    \
"

  for ix in 7 0 1 2 3 4 5 6; do
    echo -e "\
3${ix}   \
\033[49m\033[3${ix}m${ANSI_COLORS[ix]}\033[0m\
\033[40m\033[3${ix}m${ANSI_COLORS[ix]}\033[0m\
\033[47m\033[3${ix}m${ANSI_COLORS[ix]}\033[0m\
"
    echo -e "\
9${ix}   \
\033[49m\033[9${ix}m${LIGHT_COLORS[ix]}\033[0m\
\033[40m\033[9${ix}m${LIGHT_COLORS[ix]}\033[0m\
\033[47m\033[9${ix}m${LIGHT_COLORS[ix]}\033[0m\
"
  done
}
export PATH="/home/ousttrue/.pixi/bin:$PATH"
