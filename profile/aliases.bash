#!/usr/bin/env bash

echo_run(){ echo -e "\033[0;36m$*\033[0m" && $*; }
make_alias(){ alias $1="_(){ echo -e \"\033[0;36m$2\033[0m\"; $2; } && _"; }
alias ll='ls -lhFG'

# rake
alias r="echo_run rake"

# git
alias gl="echo_run git pull --rebase"
alias gh="echo_run git push"
alias glrh="gl && r && gh"

# ps
make_alias psg "ps -aef | grep \$*"

if [ -e ~/profile/private_aliases.bash ]; then
  . ~/profile/private_aliases.bash
fi
