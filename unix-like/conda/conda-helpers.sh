# update conda
uc() {
    conda update --name base conda
}

# list environments
le() {
    conda info --envs
}

# create named environment with package specifications
ce() {
    conda create --name "${1}" "${@:2}"
}

# activate environment
ae() {
    conda activate "${1}"
}

# update all packages in environment
ue() {
    conda update --name "${1:-$(basename ${CONDA_DEFAULT_ENV})}" --update-all
}

# deactivate environment
de() {
    conda deactivate
}

# delete environment and all packages
re() {
    conda remove --name "${1}" --all
}

# clean cache
cc() {
    conda clean --all --force-pkgs-dirs
}
