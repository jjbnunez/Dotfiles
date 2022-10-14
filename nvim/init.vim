" vim-plug initialization
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-bbye'
    Plug 'simeji/winresizer'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
set undodir=$XDG_CONFIG_HOME/nvim/undo

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

" special remap for invoking fzf
nnoremap <leader>p :FZF<cr>

" special remap for simeji/winresizer window resizer plugin
let g:winresizer_start_key = "<leader>w"

" special remap for standardizing split window keybind with tmux
nnoremap <c-w>h <c-w>s

" configure powershell for shell
" see :help powershell
let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote= shellxquote=

" configure terminal behavior
tnoremap <Esc> <C-\><C-n>

""""""""""""
" coc.nvim "
""""""""""""
" some servers have issues with backup files
set nobackup
set nowritebackup

" having longer updatetime (default 4000 ms) leads
" to noticeable delays and poor user experience
set updatetime=300

" always show the signcolumn, otherwise it would shift
" the text each time diagnostics appear or become resolved
set signcolumn=yes

" use tab for trigger completion with characters ahead and navigate
" NOTE: there's always complete item selected by default
" you may want to enable no select by `"suggest.noselect": true`
" NOTE: use command ':verbose imap <tab>' to make sure tab is not
" mapped by another plugin before putting this into your config
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" make <CR> accept the selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" use <C-space> to trigger completion
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif
