" NEOVIM CONFIG FOR JBNUNEZ
" =========================

" Make the clipboard universal to the OS
set clipboard+=unnamedplus

" Unmap the arrow keys.
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Disable the swap file option
set noswapfile

" Enable an undo tree for every file
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000

" Enable line numbers
set number

" Define sensible auto-indent behavior
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Allow for closing modified buffers that are hidden
set hidden
