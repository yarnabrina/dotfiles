# setup
platform=${OSTYPE//[0-9.]/}

if [[ $platform == "linux-gnu" ]]; then
    LS_COLOUR_FLAG="--color=auto"
elif [[ $platform == "darwin" ]]; then
    LS_COLOUR_FLAG="-G"
fi

# non-hidden files
alias ls="ls -F -h -l ${LS_COLOUR_FLAG}"

# almost complete ls
alias lsa="ls -A -F -h -l ${LS_COLOUR_FLAG}"

# teardown
unset platform
unset LS_COLOUR_FLAG
