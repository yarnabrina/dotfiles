#!/usr/bin/env zsh

set -x

function remove_zsh_files() {
    rm -f "${HOME}"/.zshrc
}

function remove_bash_files() {
    rm -f "${HOME}"/.bashrc
}

if [[ -n "${ZSH_VERSION:-}" ]]; then
    remove_zsh_files
elif [[ -n "${BASH_VERSION:-}" ]]; then
    remove_bash_files
fi

if [[ -x "$(command -v vim)" ]]; then
    rm -rf "${HOME}"/.vim
    rm -f "${HOME}"/.vimrc
fi

if [[ -x "$(command -v git)" ]]; then
    rm -f "${HOME}"/.gitattributes
    rm -f "${HOME}"/.gitignore
    rm -f "${HOME}"/.gitconfig
fi

if [[ -x "${HOME}"/conda-installation/bin/conda ]]; then
    rm -f "${HOME}"/.condarc
fi
