#!/usr/bin/env zsh

# location of history file
export HISTFILE="$HOME/.zsh_history"

# ignore specific commands
export HISTORY_IGNORE="(cd:cd *:clear:exit:history:ls:ls *:man *:pwd)"

# amount of history in memory
export HISTSIZE=50000

# amount of history in file
export SAVEHIST=100000
