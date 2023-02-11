# setup
FUNCTIONS_DIRECTORY="${HOME}/dotfiles/unix-like/shell/functions"

source "${FUNCTIONS_DIRECTORY}"/compare-files.sh
source "${FUNCTIONS_DIRECTORY}"/others.sh
source "${FUNCTIONS_DIRECTORY}"/pip-helpers.sh
source "${FUNCTIONS_DIRECTORY}"/venv-helpers.sh

# teardown
unset FUNCTIONS_DIRECTORY
