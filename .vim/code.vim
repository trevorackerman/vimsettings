set path+=**

" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" Extend % to match if/fi, do/done, and tags
runtime! macros/matchit.vim

" Color scheme (terminal)
set background=dark

" monokai: curl -fLo ~/.vim/colors/monokai.vim --create-dirs \
"   https://raw.githubusercontent.com/crusoexia/vim-monokai/master/colors/monokai.vim
silent! colorscheme monokai

" Install vim-go:
"   git clone https://github.com/fatih/vim-go ~/.vim/pack/plugins/start/vim-go
"   git -C ~/.vim/pack/plugins/start/vim-go checkout e6788d12
"   Start vim and at the command prompt type :GoInstallBinaries

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

set grepprg=rg\ --vimgrep\ --smart-case
set grepformat=%f:%l:%c:%m

