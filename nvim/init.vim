" vim-plug initialization
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-bbye'
    Plug 'simeji/winresizer'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'
    Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" special csv file config
" formats things in a more readable way
" and preserves formatting when writing file
autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
autocmd BufWritePre *.csv :%UnArrangeColumn

" use system-wide clipboard
set clipboard+=unnamedplus

" remove arrow key usage
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" no swap file
set noswapfile

" save undo-trees in files
set undofile
set undodir=$HOME/.config/nvim/undo

" number of undo saved
set undolevels=10000
set undoreload=10000

" set line number
set number

" use 4 spaces instead of tab
" copy indent from current line when starting a new line
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" prevent hidden modified buffers from preventing quits
set hidden

" set the spacebar as a leader for normal mode
nnoremap <space> <nop>
let mapleader = "\<space>"
nnoremap <leader>bn :bn<cr> ;buffer next
nnoremap <leader>bp :bp<cr> ;buffer previous
nnoremap <leader>tn gt ;new tab

" special remap for moll/vim-bbye buffer delete plugin
nnoremap <leader>bd :Bdelete<cr> ;delete buffer

" special remap for simeji/winresizer window resizer plugin
let g:winresizer_start_key = "<leader>w"

" special remap for standardizing split window keybind with tmux
nnoremap <c-w>h <c-w>s
