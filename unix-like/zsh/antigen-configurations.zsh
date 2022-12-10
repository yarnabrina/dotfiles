#!/usr/bin/env zsh

# Reference: https://github.com/zsh-users/antigen/wiki/Commands

# load bundles
antigen bundles <<EOBUNDLES
    ## real-time type-ahead autocompletion
    https://github.com/marlonrichert/zsh-autocomplete.git@main

    ## fast/unobtrusive autosuggestions
    https://github.com/zsh-users/zsh-autosuggestions.git@master

    ## syntax highlighting
    https://github.com/zsh-users/zsh-syntax-highlighting.git@master
EOBUNDLES

# load theme
antigen theme https://github.com/romkatv/powerlevel10k.git@master

# inform about completion
antigen apply
