#!/usr/bin/env bash

export PS1="\033[0;32m\u@\h\033[0m:\033[0;34m\w"
. $HOME/profile/aliases.bash
. $HOME/profile/git.bash
. $HOME/profile/rvm.bash

export PATH=$HOME/sh:$PATH

. $HOME/profile/finish.bash
