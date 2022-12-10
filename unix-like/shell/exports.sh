# setup
EXPORT_DIRECTORY="${HOME}/dotfiles/unix-like/shell/exports"

source "${EXPORT_DIRECTORY}"/colour.sh
source "${EXPORT_DIRECTORY}"/language.sh
source "${EXPORT_DIRECTORY}"/others.sh
source "${EXPORT_DIRECTORY}"/pager.sh
source "${EXPORT_DIRECTORY}"/text-editor.sh

# teardown
unset EXPORT_DIRECTORY
