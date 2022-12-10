# setup
ALIAS_DIRECTORY="${HOME}/dotfiles/unix-like/shell/aliases"

source "${ALIAS_DIRECTORY}"/directory-contents.sh
source "${ALIAS_DIRECTORY}"/directory-navigation.sh
source "${ALIAS_DIRECTORY}"/disk-usage.sh
source "${ALIAS_DIRECTORY}"/others.sh
source "${ALIAS_DIRECTORY}"/pip-helpers.sh
source "${ALIAS_DIRECTORY}"/search-hierarchy.sh
source "${ALIAS_DIRECTORY}"/vim-helpers.sh

# teardown
unset ALIAS_DIRECTORY
