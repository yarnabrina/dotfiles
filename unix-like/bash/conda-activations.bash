#!/usr/bin/env bash

# setup
CONDA_EXECUTABLE="${CONDA_INSTALLATION_DIRECTORY}"/bin/conda

# conda initialisation
__conda_setup="$(${CONDA_EXECUTABLE} 'shell.bash' 'hook' 2> /dev/null)"

if [[ $? -eq 0 ]]; then
    eval "${__conda_setup}"
else
    if [[ -f "${CONDA_INSTALLATION_DIRECTORY}/etc/profile.d/conda.sh" ]]; then
        . "${CONDA_INSTALLATION_DIRECTORY}/etc/profile.d/conda.sh"
    else
        export PATH="${CONDA_INSTALLATION_DIRECTORY}/bin:${PATH}"
    fi
fi

unset __conda_setup

# teardown
unset CONDA_EXECUTABLE
