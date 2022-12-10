#!/usr/bin/env bash

# stop if not running interactively
case $- in
    *i*) ;;
      *) return;;
esac

# common settings

## setup
COMMON_DIRECTORY="${HOME}/dotfiles/unix-like/shell"

if [[ -f "${COMMON_DIRECTORY}"/aliases.sh ]]; then
    source "${COMMON_DIRECTORY}"/aliases.sh
fi

if [[ -f "${COMMON_DIRECTORY}"/exports.sh ]]; then
    source "${COMMON_DIRECTORY}"/exports.sh
fi

if [[ -f "${COMMON_DIRECTORY}"/functions.sh ]]; then
    source "${COMMON_DIRECTORY}"/functions.sh
fi

## teardown
unset COMMON_DIRECTORY

# adding diff-so-fancy to PATH

## setup
DIFF_SO_FANCY_DIRECTORY="${HOME}/dotfiles/unix-like/tools/diff-so-fancy"

if [[ -x "${DIFF_SO_FANCY_DIRECTORY}"/diff-so-fancy ]]; then
    export PATH="${DIFF_SO_FANCY_DIRECTORY}:$PATH"
fi

## teardown
unset DIFF_SO_FANCY_DIRECTORY

# make less more friendly for non-text input files
if [[ -x /usr/bin/lesspipe ]]; then
    eval "$(SHELL=/bin/sh lesspipe)"
fi

# specific settings

## setup
BASH_DIRECTORY="${HOME}/dotfiles/unix-like/bash"

if [[ -f "${BASH_DIRECTORY}"/history-exports.bash ]]; then
    source "${BASH_DIRECTORY}"/history-exports.bash
fi

if [[ -f "${BASH_DIRECTORY}"/shopt-options.bash ]]; then
    source "${BASH_DIRECTORY}"/shopt-options.bash
fi

if [[ -f "${BASH_DIRECTORY}"/key-bindings.bash ]]; then
    source "${BASH_DIRECTORY}"/key-bindings.bash
fi

# enable programmable completion features
if ! shopt -oq posix; then
    if [[ -f /usr/share/bash-completion/bash_completion ]]; then
        . /usr/share/bash-completion/bash_completion
    elif [[ -f /etc/bash_completion ]]; then
        . /etc/bash_completion
    fi
fi

## loading conda

### setup
CONDA_INSTALLATION_DIRECTORY="${HOME}/conda-installation"

if [[ -x "${CONDA_INSTALLATION_DIRECTORY}"/bin/conda ]]; then
    source "${BASH_DIRECTORY}"/conda-activations.bash
    unset CONDA_INSTALLATION_DIRECTORY

    source "${HOME}"/dotfiles/unix-like/conda/conda-helpers.sh

    export CONDA_ENVIRONMENTS_DIRECTORY="${HOME}/conda-environments"
fi

### teardown
unset CONDA_INSTALLATION_DIRECTORY

## enabling gitstatus prompt
if [[ -f "${BASH_DIRECTORY}"/gitstatus-prompt.bash ]]; then
    source "${BASH_DIRECTORY}"/gitstatus-prompt.bash
fi

## teardown
unset BASH_DIRECTORY

# local settings
if [[ -f "${HOME}"/.bashrc.local ]]; then
    source "${HOME}"/.bashrc.local
fi
