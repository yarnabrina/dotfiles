" References
" https://vim.fandom.com/wiki/Example_vimrc
" https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim
" reddit/medium/etc.

" reset possible unexpected distribution defaults, and enable all Vim features
set nocompatible

" allow indentation specific for file type
if has('filetype')
  filetype indent plugin on
endif

" enable syntax highlighting
if has('syntax')
  syntax on
endif

" improve command line completion
set wildmenu

" highlight matches during search
set hlsearch

" avoid security vulnerability
set nomodeline

" perform case insensitive search except with capitals
set ignorecase
set smartcase

" allow backspace over indentation, start of line and line breaks
set backspace=indent,eol,start

" use indentation of current line in absence of file type specific indentation
set autoindent

" display cursor position
set ruler

" always display status line
set laststatus=2

" dialogue to save unsaved changes
set confirm

" enable mouse use
if has('mouse')
  set mouse=a
endif

" display line numbers
set number

" use soft tab of 4 spaces instead of hard tab
set shiftwidth=4
set softtabstop=4
set expandtab

" highlight row with cursor
set cursorline

" highlight column with cursor
set cursorcolumn

" search matching characters before completion
set incsearch

" display current mode
set showmode

" set encoding
set encoding=utf-8

" clear search highlight and messsages with space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" allow left/right arrow keys to change lines
set whichwrap+=<,>,[,]

" use dark background
set background=dark

" use theme
colorscheme PaperColor

" keep cursor mid screen vertically
set scrolloff=5

" keep cursor mid screen horizontally
set sidescroll=0
set sidescrolloff=5

" show @@@ at end of last displayed columns
set display+=lastline

" show \ at start of wrapped lines
set showbreak=\\ "

" charecters to show in list mode
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" skip included files for autocomplete
set complete-=i

" decrease timeout
set ttimeout
set ttimeoutlen=100

" load changes made outside vim automatically if not modified in vim
set autoread

" vim history limit
set history=1000
