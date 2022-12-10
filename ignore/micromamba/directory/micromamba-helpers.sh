# list environments
le() {
    micromamba env list
}

# create named environment with package specifications
ce() {
    micromamba create --name "${1}" "${@:2}"
}

# activate environment
ae() {
    micromamba activate "${1}"
}

# update all packages in environment
ue() {
    micromamba update --name "${1:-$(basename ${CONDA_DEFAULT_ENV})}" --update-all
}

# deactivate environment
de() {
    micromamba deactivate
}

# delete environment and all packages
re() {
    micromamba remove --name "${1}" --all
}

# clean cache
cc() {
    micromamba clean --all --trash --force-pkgs-dirs
}
