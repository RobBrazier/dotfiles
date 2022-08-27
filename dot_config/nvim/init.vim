set runtimepath^=$XDG_CONFIG_HOME/vim
set runtimepath+=$XDG_DATA_HOME/vim
set runtimepath+=$XDG_CONFIG_HOME/vim/after

set packpath^=$XDG_DATA_HOME/vim,$XDG_CONFIG_HOME/vim
set packpath+=$XDG_CONFIG_HOME/vim/after,$XDG_DATA_HOME/vim/after

let g:netrw_home = $XDG_DATA_HOME."/vim"
call mkdir($XDG_DATA_HOME."/vim/spell", 'p')

set backupdir=$XDG_STATE_HOME/vim/backup | call mkdir(&backupdir, 'p')
set directory=$XDG_STATE_HOME/vim/swap   | call mkdir(&directory, 'p')
set undodir=$XDG_STATE_HOME/vim/undo     | call mkdir(&undodir,   'p')
set viewdir=$XDG_STATE_HOME/vim/view     | call mkdir(&viewdir,   'p')

if !has('nvim') | set viminfofile=$XDG_STATE_HOME/vim/viminfo | endif

syntax on

set nocompatible

filetype on
filetype plugin on
filetype plugin indent on

set tabstop=2 shiftwidth=2 expandtab
set ignorecase
set smartcase
set number
set incsearch
set hlsearch
set linebreak
set autoindent
set smartindent
set showtabline=1

set wildmode=longest,list
set wildmenu

set showcmd
set autowrite
set hidden  
set mouse=a
set history=1000
set scrolloff=5
set ruler
set backspace=indent,eol,start
set shortmess=atI
set autochdir
set viminfo='20,<50,s10,h,%
let mapleader = ","