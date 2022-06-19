#!/usr/bin/env zsh

# use emacs key bindings
bindkey -e

# [Home] - beginning of line
bindkey -M emacs "^[[7~" beginning-of-line
bindkey -M viins "^[[7~" beginning-of-line
bindkey -M vicmd "^[[7~" beginning-of-line

bindkey -M emacs "^[[H" beginning-of-line
bindkey -M viins "^[[H" beginning-of-line
bindkey -M vicmd "^[[H" beginning-of-line

if [[ -n "${terminfo[khome]}" ]]; then
    bindkey -M emacs "${terminfo[khome]}" beginning-of-line
    bindkey -M viins "${terminfo[khome]}" beginning-of-line
    bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
fi

# [End] - end of line
bindkey -M emacs "^[[8~" end-of-line
bindkey -M viins "^[[8~" end-of-line
bindkey -M vicmd "^[[8~" end-of-line

bindkey -M emacs "^[[F" end-of-line
bindkey -M viins "^[[F" end-of-line
bindkey -M vicmd "^[[F" end-of-line

if [[ -n "${terminfo[kend]}" ]]; then
    bindkey -M emacs "${terminfo[kend]}" end-of-line
    bindkey -M viins "${terminfo[kend]}" end-of-line
    bindkey -M vicmd "${terminfo[kend]}"   end-of-line
fi

# [Backspace] - delete backward
bindkey -M emacs "^?" backward-delete-char
bindkey -M viins "^?" backward-delete-char
bindkey -M vicmd "^?" backward-delete-char

# [Delete] - delete forward
if [[ -n "${terminfo[kdch1]}" ]]; then
    bindkey -M emacs "${terminfo[kdch1]}" delete-char
    bindkey -M viins "${terminfo[kdch1]}" delete-char
    bindkey -M vicmd "${terminfo[kdch1]}" delete-char
fi

# [Insert] - overwrite next characters
bindkey -M emacs "^[[2~" overwrite-mode
bindkey -M viins "^[[2~" overwrite-mode
bindkey -M vicmd "^[[2~" overwrite-mode

# [Delete] - delete next characters
bindkey -M emacs "^[[3~" delete-char
bindkey -M viins "^[[3~" delete-char
bindkey -M vicmd "^[[3~" delete-char

# [RightArrow] - move cursor after next character
bindkey -M emacs "^[[C" forward-char
bindkey -M viins "^[[C" forward-char
bindkey -M vicmd "^[[C" forward-char

# [LeftArrow] - move cursor before previous character
bindkey -M emacs "^[[D" backward-char
bindkey -M viins "^[[D" backward-char
bindkey -M vicmd "^[[D" backward-char

# [PageUp] - move to previous event in history
bindkey -M emacs "^[[5~" up-line-or-history
bindkey -M viins "^[[5~" up-line-or-history
bindkey -M vicmd "^[[5~" up-line-or-history

if [[ -n "${terminfo[kpp]}" ]]; then
    bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
    bindkey -M viins "${terminfo[kpp]}" up-line-or-history
    bindkey -M vicmd "${terminfo[kpp]}" up-line-or-history
fi

# [PageDown] - move to next event in history
bindkey -M emacs "^[[6~" down-line-or-history
bindkey -M viins "^[[6~" down-line-or-history
bindkey -M vicmd "^[[6~" down-line-or-history

if [[ -n "${terminfo[knp]}" ]]; then
    bindkey -M emacs "${terminfo[knp]}" down-line-or-history
    bindkey -M viins "${terminfo[knp]}" down-line-or-history
    bindkey -M vicmd "${terminfo[knp]}" down-line-or-history
fi

# [UpArrow] - search backward in history for lines up to cursor
if [[ -n "${terminfo[kcuu1]}" ]]; then
    bindkey -M emacs "${terminfo[kcuu1]}" history-beginning-search-backward
    bindkey -M viins "${terminfo[kcuu1]}" history-beginning-search-backward
    bindkey -M vicmd "${terminfo[kcuu1]}" history-beginning-search-backward
fi

# [DownArrow] - search forward in history for lines up to cursor
if [[ -n "${terminfo[kcud1]}" ]]; then
    bindkey -M emacs "${terminfo[kcud1]}" history-beginning-search-forward
    bindkey -M viins "${terminfo[kcud1]}" history-beginning-search-forward
    bindkey -M vicmd "${terminfo[kcud1]}" history-beginning-search-forward
fi

# [Ctrl+RightArrow] - move cursor after next word
bindkey -M emacs "^[[1;5C" forward-word
bindkey -M viins "^[[1;5C" forward-word
bindkey -M vicmd "^[[1;5C" forward-word

# [Ctrl+LeftArrow] - move cursor before previous word
bindkey -M emacs "^[[1;5D" backward-word
bindkey -M viins "^[[1;5D" backward-word
bindkey -M vicmd "^[[1;5D" backward-word

# [Ctrl+Backapace] - delete previous word
bindkey -M emacs "^H" backward-kill-word
bindkey -M viins "^H" backward-kill-word
bindkey -M vicmd "^H" backward-kill-word

# [Ctrl+Delete] - delete next word
bindkey -M emacs "^[[3;5~" kill-word
bindkey -M viins "^[[3;5~" kill-word
bindkey -M vicmd "^[[3;5~" kill-word

# [Shift-Tab] - move through completion menu backwards
bindkey -M emacs "^[[Z" reverse-menu-complete
bindkey -M viins "^[[Z" reverse-menu-complete
bindkey -M vicmd "^[[Z" reverse-menu-complete

if [[ -n "${terminfo[kcbt]}" ]]; then
    bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
    bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
    bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
fi

# [Ctrl+z] - undo last action
bindkey -M emacs "^Z" undo
bindkey -M viins "^Z" undo
bindkey -M vicmd "^Z" undo

# [Ctrl+y] - redo last action
bindkey -M emacs "^Y" redo
bindkey -M viins "^Y" redo
bindkey -M vicmd "^Y" redo
