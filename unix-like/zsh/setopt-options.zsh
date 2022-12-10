#!/usr/bin/env zsh

# changing directories

## `cd` is implied by providing name of directory
setopt AUTO_CD

## expanding as predeeded by `~` is skipped
unsetopt CDABLE_VARS

# completion

## choices are listed if ambiguous
setopt AUTO_LIST

## menu completion is used if completion requested more than once
setopt AUTO_MENU

## insert `/` if directory name is autocompleted
setopt AUTO_PARAM_SLASH

## auto-completed `/` is removed in case of word or command delimiters
setopt AUTO_REMOVE_SLASH

## hash full command before spelling correction
setopt HASH_LIST_ALL

## no choices for unambiguous completions
setopt LIST_AMBIGUOUS

## return status code `1` for ambiguous completions
setopt LIST_BEEP

## show completions in columns to take less lines
setopt LIST_PACKED

## list completions columnwise
unsetopt LIST_ROWS_FIRST

## show file type identifiers
setopt LIST_TYPES

## avoid insert top match for ambiguous completions
unsetopt MENU_COMPLETE

## avoid insert exact match for ambiguous completions
unsetopt REC_EXACT

# expansion and globbing

## print error for badly formed patterns
setopt BAD_PATTERN

## case sensitive globbing
setopt CASE_GLOB

## use `#`, `~`, `*` as part of patterns
setopt EXTENDED_GLOB

## sort file names numerically instead of lexicographically
setopt NUMERIC_GLOB_SORT

## disable array expansion
unsetopt RC_EXPAND_PARAM

# history

## avoid replace history
setopt APPEND_HISTORY

## avoid history timestamps
unsetopt EXTENDED_HISTORY

## delete duplicate history first
setopt HIST_EXPIRE_DUPS_FIRST

## use file lock provided by operating system
setopt HIST_FCNTL_LOCK

## avoid display of duplicate non-contiguous history
setopt HIST_FIND_NO_DUPS

## avoid duplicate history
setopt HIST_IGNORE_ALL_DUPS

## avoid duplicate of previous event
setopt HIST_IGNORE_DUPS

## avoid commands starting with space
setopt HIST_IGNORE_SPACE

## words read from history are divided as normal CLI
setopt HIST_LEX_WORDS

## keep function definition
unsetopt HIST_NO_FUNCTIONS

## remove edited history
setopt HIST_NO_STORE

## remove superfluous blanks
setopt HIST_REDUCE_BLANKS

## avoid store duplicate history
setopt HIST_SAVE_NO_DUPS

## store after shell exit
unsetopt INC_APPEND_HISTORY

## avoid history update on command finish
unsetopt INC_APPEND_HISTORY_TIME

## add new typed commands to history file
setopt SHARE_HISTORY

# input/output

## expand aliases
setopt ALIASES

## allow `>` to truncate existing files
setopt CLOBBER

## attempt spelling correction
setopt CORRECT

## skip to attempt spelling of all arguments
unsetopt CORRECT_ALL

## allow comments
setopt INTERACTIVE_COMMENTS

##  avoid prompting before deleting with *
setopt RM_STAR_SILENT

## allow short forms
setopt SHORT_LOOPS

# job control

## warn about running processes while exiting
setopt CHECK_JOBS

# scripts and functions

## function name cannot be expanded as an alias
unsetopt ALIAS_FUNC_DEF

# shell emulation

## no error when `>>` is used for non-existing file
setopt APPEND_CREATE

## fail on error
unsetopt CONTINUE_ON_ERROR

# shell state

## do not exit shell after just one command
unsetopt SINGLE_COMMAND

# zsh line editor

## skip beep on error in ZLE
unsetopt BEEP

## use multi-line editor
unsetopt SINGLE_LINE_ZLE

## enable zle
setopt ZLE
