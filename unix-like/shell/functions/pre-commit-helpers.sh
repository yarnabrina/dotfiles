# run pre-commit hooks on all files
function pcra() {
    if [[ "${#}" -eq 0 ]]; then
        echo "Running all pre-commit hooks on all files in the repository"
        pre-commit run --all-files
    else
        echo "Running "${1}" pre-commit hook on all files in the repository"
        pre-commit run --all-files "${1}"
    fi
}
