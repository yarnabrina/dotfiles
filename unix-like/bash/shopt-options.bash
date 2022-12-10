#!/usr/bin/env bash

# if set, a command name that is the name of a directory is executed as if it were the argument to the cd command
shopt -s autocd

# if set, an argument to the cd builtin command that is not a directory is assumed to be the name of a variable whose value is the directory to change to
shopt -u cdable_vars

# if set,  minor errors in the spelling of a directory component in a cd command will be corrected
shopt -s cdspell

# if set, bash checks the window size after each external (non-builtin) command and, if necessary, updates the values of LINES and COLUMNS
shopt -s checkwinsize

# if set, bash attempts to save all lines of a multiple-line command in the same history entry
shopt -s cmdhist

# if set, bash attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist
shopt -s dirspell

# if set, aliases are expanded as described above under ALIASES
shopt -s expand_aliases

# if set, the extended pattern matching features described above (see Pattern Matching) are enabled
shopt -s extglob

# if set, the history list is appended to the file named by the value of the HISTFILE variable when the shell exits, rather than overwriting the file
shopt -s histappend

# if set, allow a word beginning with # to cause that word and all remaining characters on that line to be ignored in an interactive shell
shopt -s interactive_comments

# if set, bash matches filenames in a case-insensitive fashion when performing pathname expansion
shopt -u nocaseglob
