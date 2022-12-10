# Reference: https://vaneyckt.io/posts/safer_bash_scripts_with_set_euxo_pipefail/
# -e           : exit on first non-zero status (failure)
# -o pipefail  : return status of rightmost command with non-zero exit, or zero
# -u           : error in case of undefined variables
# -x           : display executed command
# -E           : inherit ERR traps to subshells
set -Eeuxo pipefail

# setup

SOURCE_DIRECTORY="${HOME}"/dotfiles/unix-like

source "${SOURCE_DIRECTORY}"/uninstall.sh

function add_zsh_files() {
    ln -s "${SOURCE_DIRECTORY}"/zsh/zsh-configurations.zsh "${HOME}"/.zshrc
}

function add_bash_files() {
    ln -s "${SOURCE_DIRECTORY}"/bash/bash-configurations.bash "${HOME}"/.bashrc
}

if [[ -n "${ZSH_VERSION:-}" ]]; then
    add_zsh_files
elif [[ -n "${BASH_VERSION:-}" ]]; then
    add_bash_files
fi

if [[ -x "$(command -v vim)" ]]; then
    mkdir -p "${HOME}"/.vim/colors
    ln -s "${SOURCE_DIRECTORY}"/tools/papercolor-theme/colors/PaperColor.vim "${HOME}"/.vim/colors
    ln -s "${SOURCE_DIRECTORY}"/vim/vim-configurations.vim "${HOME}"/.vimrc
fi

if [[ -x "$(command -v git)" ]]; then
    ## setup
    GIT_DIRECTORY="${SOURCE_DIRECTORY}/git"

    ln -s "${GIT_DIRECTORY}"/global-git-attributes.gitattributes "${HOME}"/.gitattributes
    ln -s "${GIT_DIRECTORY}"/global-git-ignore-files.gitignore "${HOME}"/.gitignore
    ln -s "${GIT_DIRECTORY}"/global-git-configurations.gitconfig "${HOME}"/.gitconfig

    ## teardown
    unset GIT_DIRECTORY
fi

if [[ -x "${HOME}"/conda-installation/bin/conda ]]; then
    ln -s "${SOURCE_DIRECTORY}"/conda/conda-configurations.yaml "${HOME}"/.condarc
fi

# teardown
unset SOURCE_DIRECTORY
