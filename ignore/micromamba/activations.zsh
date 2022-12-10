#!/usr/bin/env zsh

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/root/.local/bin/micromamba";
export MAMBA_ROOT_PREFIX="/root/micromamba-environments";
__mamba_setup="$('/root/.local/bin/micromamba' shell hook --shell zsh --prefix '/root/micromamba-environments' 2> /dev/null)"
if [[ $? -eq 0 ]]; then
    eval "$__mamba_setup"
else
    if [[ -f "/root/micromamba-environments/etc/profile.d/micromamba.sh" ]]; then
        . "/root/micromamba-environments/etc/profile.d/micromamba.sh"
    else
        export  PATH="/root/micromamba-environments/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<
