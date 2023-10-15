let mapleader = " "

syntax on

set relativenumber
set number relativenumber
set noswapfile
set nobackup
set undofile
set clipboard=unnamed
set wildmenu
set cursorline
set hlsearch
set ruler

set updatetime=50

nnoremap <M-Up> :m-2<CR>==
inoremap <M-Up> <Esc>:m-2<CR>==gi
vnoremap <M-Up> :m-2<CR>gv=gv
nnoremap <M-Down> :m+<CR>==
inoremap <M-Down> <Esc>:m+<CR>==gi
vnoremap <M-Down> :m+<CR>gv=gv
