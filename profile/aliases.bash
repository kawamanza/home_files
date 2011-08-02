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
      local_sentence=`echo $1 | sed -e 's/\\\\/\\\\\\\\\\\\\\\\/g' | sed -e 's/"/\\\\"/g' | sed -e 's/$\\([^0-9]\\)/\\\\$\1/g'`
      sentence="$sentence echo -e \"\033[0;36m${local_sentence}\033[0m\" && $1"
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
make_alias fetch-all-git-projects \
  0 'for dir in */.git; do if [ "$dir" != "*/.git" ]; then echo $dir; cd $dir/..; git fetch; cd ..; fi; done'

# ps
make_alias psg 1 "ps -aef | grep --color \$@"

# grep
make_alias g \
  1 'grep -rns "$1" *' \
  2 'find . -name $2 | xargs grep -ns "$1"'
make_alias gi \
  1 'grep -rins "$1" *' \
  2 'find . -name $2 | xargs grep -ins "$1"'

# netstat
make_alias netmonitor \
  1 'while [ 1 ]; do netstat -an | egrep ":$1" | grep EST | wc -l; sleep 1; done' \
  2 'while [ 1 ]; do netstat -an | egrep ":$1" | grep EST | wc -l; sleep $2; done'

if [ -e ~/profile/private_aliases.bash ]; then
  . ~/profile/private_aliases.bash
fi
