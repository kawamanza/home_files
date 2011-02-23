#!/usr/bin/env bash

if [ -e /usr/local/git/contrib/completion/git-completion.bash ]; then
  . /usr/local/git/contrib/completion/git-completion.bash
  function git_another_author {
    GIT_AUTHOR_NAME=`git config --get user.name`
    GLOBAL_GIT_AUTHOR_NAME=`git config --global --get user.name`
    GIT_AUTHOR_EMAIL=`git config --get user.email`
    GLOBAL_GIT_AUTHOR_EMAIL=`git config --global --get user.email`
    if [[ ! -z "$GIT_AUTHOR_EMAIL" ]]; then
      if [[ "$GIT_AUTHOR_EMAIL" == "$GLOBAL_GIT_AUTHOR_EMAIL" ]]; then
        GIT_AUTHOR_EMAIL=""
      fi
    else
      GIT_AUTHOR_EMAIL=""
    fi
    if [[ ! -z "$GIT_AUTHOR_NAME" ]]; then
      if [[ "$GIT_AUTHOR_NAME" == "$GLOBAL_GIT_AUTHOR_NAME" ]]; then
        GIT_AUTHOR_NAME=""
      fi
    else
      GIT_AUTHOR_NAME=""
    fi
    GIT_AUTHOR=$GIT_AUTHOR_NAME
    if [[ ! -z "$GIT_AUTHOR_EMAIL" ]]; then
      if [[ ! -z "$GIT_AUTHOR" ]]; then
        GIT_AUTHOR=$GIT_AUTHOR', '
      fi
      GIT_AUTHOR=$GIT_AUTHOR$GIT_AUTHOR_EMAIL
    fi
    if [[ ! -z "$GIT_AUTHOR" ]]; then
      echo
      echo "[$GIT_AUTHOR]"
    fi
  }
  export PS1=$PS1'\033[0;36m$(git_another_author)\033[0;33m$(__git_ps1 " (%s)")\033[0m'
fi
