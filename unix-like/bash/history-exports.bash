#!/usr/bin/env bash

# lines beginning with space and duplicates of previous entries are ignored
export HISTCONTROL="erasedups:ignoreboth"

# ignore specific commands
export HISTIGNORE="cd:cd *:clear:exit:history:ls:ls *:man *:pwd"

# location of history file
export HISTFILE="$HOME/.bash_history"

# amount of history in file
export HISTFILESIZE=100000

# amount of history in memory
export HISTSIZE=50000
