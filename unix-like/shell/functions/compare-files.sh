# side by side diff
function ydiff() {
    diff -t -y -W "${COLUMNS}" --suppress-common-lines "${@}" | less
}

# fancier diff
function fdiff() {
    diff -t -u "${1}" "${2}" | diff-so-fancy | less
}
