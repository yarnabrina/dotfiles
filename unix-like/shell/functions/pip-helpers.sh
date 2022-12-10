# update useful python packages
function ppu() {
    python3 -m pip install --upgrade pip setuptools wheel
}

# remove all wheel cache of python packages
function ppc() {
    python3 -m pip cache purge
}

# list all python packages
function ppf() {
    python3 -m pip freeze --local
}

# get details of a python package
function pps() {
    python3 -m pip show "${1}"
}
