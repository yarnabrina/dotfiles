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

# activate virtual environment if exists, create first otherwise
function venv() {
    if [[ -n "${1}" ]]; then
        if [[ ! -d "${1}" ]]; then
            echo "Failure: directory ${1} not found"
            return 1
        elif [[ ! -f "${1}"/bin/activate ]]; then
            echo "Failure: file ${1} not found"
            return 1
        else
            source "${1}"/bin/activate
        fi
    elif [[ -d "${PWD}"/venv ]] && [[ -f "${PWD}"/venv/bin/activate ]]; then
        source "${PWD}"/venv/bin/activate
    elif [[ -d "${PWD}"/virtualenv ]] && [[ -f "${PWD}"/virtualenv/bin/activate ]]; then
        source "${PWD}"/virtualenv/bin/activate
    else
        echo "Status: missing virtual environment, creating venv"

        python3 -m venv venv
        source ./venv/bin/activate
    fi
}
