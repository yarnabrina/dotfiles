#!/usr/bin/env zsh

# stop if not running interactively
case $- in
    *i*) ;;
      *) return;;
esac

# powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
ZSH_DIRECTORY="${HOME}/dotfiles/unix-like/zsh"

if [[ -f "${ZSH_DIRECTORY}"/history-exports.zsh ]]; then
    source "${ZSH_DIRECTORY}"/history-exports.zsh
fi

if [[ -f "${ZSH_DIRECTORY}"/setopt-options.zsh ]]; then
    source "${ZSH_DIRECTORY}"/setopt-options.zsh
fi

if [[ -f "${ZSH_DIRECTORY}"/key-bindings.zsh ]]; then
    source "${ZSH_DIRECTORY}"/key-bindings.zsh
fi

## loading antigen

### setup
ANTIGEN_DIRECTORY="${HOME}/dotfiles/unix-like/tools/antigen"

if [[ -f "${ANTIGEN_DIRECTORY}"/bin/antigen.zsh ]] && [[ -f "${ZSH_DIRECTORY}"/antigen-configurations.zsh ]]; then
    source "${ANTIGEN_DIRECTORY}"/bin/antigen.zsh
    antigen init "${ZSH_DIRECTORY}"/antigen-configurations.zsh

    # disabling default ls outputs
    zstyle ":autocomplete:*" min-input 1
fi

### teardown
unset ANTIGEN_DIRECTORY

## loading conda

### setup
CONDA_INSTALLATION_DIRECTORY="${HOME}/conda-installation"

if [[ -x "${CONDA_INSTALLATION_DIRECTORY}"/bin/conda ]]; then
    source "${ZSH_DIRECTORY}"/conda-activations.zsh
    unset CONDA_INSTALLATION_DIRECTORY

    source "${HOME}"/dotfiles/unix-like/conda/conda-helpers.sh

    export CONDA_ENVIRONMENTS_DIRECTORY="${HOME}/conda-environments"
fi

### teardown
unset CONDA_INSTALLATION_DIRECTORY

# enabling powerlevel10k prompt
if [[ -f "${ZSH_DIRECTORY}"/powerlevel10k-configurations.zsh ]]; then
    source "${ZSH_DIRECTORY}"/powerlevel10k-configurations.zsh
fi

## teardown
unset ZSH_DIRECTORY

# local settings
if [[ -f "${HOME}"/.zshrc.local ]]; then
    source "${HOME}"/.zshrc.local
fi
