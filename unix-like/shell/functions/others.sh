# create directory hierarchy and navigate
function mkcd() {
    mkdir -p "${1}"
    cd "${1}"
}

# check if command exists
function exists() {
    if ! [[ -x "$(command -v ${1})" ]]; then
        echo "Failure: ${1} not found"
        return 1
    else
        echo "Success: $(command -v ${1})"
        return 0
    fi
}

# redirect stdout and stderr to null device file
function quiet () {
    "$*" &> /dev/null &
}
