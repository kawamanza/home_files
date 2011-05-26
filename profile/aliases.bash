#!/usr/bin/env bash

echo_run(){ echo -e "\033[0;36m$*\033[0m" && $*; }
make_alias(){
  name="$1"
  shift
  sentence="("
  while [ "$1" != "" ]
  do
    if echo $1 | egrep -q '^[0-9]+$'; then
      if [ "$sentence" != "(" ]; then
        sentence="$sentence) || ("
      fi
      sentence="$sentence [[ \"\$#\" = \"$1\" ]]"
    else
      if [ "$sentence" != "(" ]; then
        sentence="$sentence &&"
      fi
      sentence="$sentence echo -e \"\033[0;36m$1\033[0m\" && $1"
    fi
    shift
  done
  if [ "$sentence" != "(" ]; then
    sentence="$sentence )"
  else
    sentence=""
  fi
  alias $name="_(){ $sentence; } && _";
}
alias ll='ls -lhFG'

# rake
alias r="echo_run rake"

# git
alias gl="echo_run git pull --rebase"
alias gh="echo_run git push"
alias glrh="gl && r && gh"

# ps
make_alias psg 1 "ps -aef | grep --color \$@"

if [ -e ~/profile/private_aliases.bash ]; then
  . ~/profile/private_aliases.bash
fi
