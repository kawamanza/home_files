#!/usr/bin/env bash

export PS1=$PS1'\033[0m\n$(date "+%d-%H:%M:%S") \$ '

[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
