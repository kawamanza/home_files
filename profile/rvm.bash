#!/usr/bin/env bash

if [ -e $HOME/.rvm/bin/rvm ]; then
  function rvm_gem_set {
    GEM_SET=`rvm gemset name`
    if [[ ! -z "$GEM_SET" ]]; then
      echo "@${GEM_SET}"
    fi
  }

  export PS1=$PS1' \033[0;31m[$($HOME/.rvm/bin/rvm-prompt i v)$(rvm_gem_set)]\033[0m'
fi
