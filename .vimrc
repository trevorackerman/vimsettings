" Don't try to be vi compatible
set nocompatible

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Flash screen on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Keep 3 lines of context above and below the cursor
set scrolloff=3
set backspace=indent,eol,start

" Allow hidden buffers, allows switching buffers without saving
set hidden

" Status bar is next to bottom most displayed line
set laststatus=2

" Show partially typed normal-mode commands on the right side of the bottom line
set showcmd

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" Give <tab> completion a menu on the command line
set wildmenu

" useful for editing yaml and other config files
set autoindent

" truncate a very long line of text to show '@@@' instead of filling screen
set display=truncate

" Confirm before quitting
set confirm: :q

if filereadable(expand('~/.vim/code.vim'))
  source ~/.vim/code.vim
endif

