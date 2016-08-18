call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set autoread
set nocompatible
set laststatus=2
set encoding=utf-8
set hidden
set history=256
set undolevels=512
set pastetoggle=<Leader>p

nore <Space> .
nore ; :
let mapleader = ","

" Power navigation, by Andrew Radev
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

nmap H 5h
nmap L 5l
xmap H 5h
xmap L 5l

map <Leader>bn :bnext<cr>
map <Leader>bp :bprevious<cr>
map <Leader>bd :bdelete<cr>

nmap <Leader><Space> :nohl<cr>
nmap <leader>nt :NERDTreeToggle<cr>
xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary

set number
set numberwidth=4
set ruler
set cul
set showmatch	
set backspace=indent,eol,start
set wildmenu
set wildignore=*~,*.swp
set showcmd	
set cmdheight=1
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic
set lazyredraw
set novisualbell
set noerrorbells
set t_vb=

syntax on
colorscheme megara
set t_Co=256

set nobackup
set nowb
set noswapfile

setlocal cryptmethod=blowfish

filetype plugin on
filetype indent on
set omnifunc=syntaxcomplete#Complete
augroup vimrcEx
au!

" Return to last edit position
autocmd BufReadPost *
     \ if line("'\"") > 1 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

set viminfo^=%

set softtabstop=4
set tabstop=4
set shiftwidth=4

set expandtab
set smarttab

set autoindent
set smartindent
set wrap

autocmd!
autocmd WinEnter,FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set sts=2 ts=2 sw=2 
autocmd FileType text setlocal textwidth=80
autocmd! BufRead,BufNewFile *.sass setfiletype sass 
autocmd FileType make setlocal noexpandtab

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
    exe "normal `z"
endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

nmap <leader>s :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
