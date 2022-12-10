#!/usr/bin/env bash

# use emacs key bindings
set editing-mode emacs

# Reference: https://codeinthehole.com/tips/the-most-important-command-line-tip-incremental-history-searching-with-inputrc/
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[C": forward-char'
bind '"\e[D": backward-char'
