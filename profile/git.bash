#!/usr/bin/env bash

if [ -e /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
  export PS1=$PS1'\033[0;33m$(__git_ps1 " (%s)")\033[0m'
fi
