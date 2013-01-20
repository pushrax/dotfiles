set nocompatible
filetype off
syntax enable


" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'


" Colours
Bundle 'altercation/vim-colors-solarized'
set t_Co=16
set background=dark
colorscheme solarized


" Syntax highlighting
Bundle 'digitaltoad/vim-jade'
Bundle 'skammer/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'


" Display
set list listchars=tab:\ \ ,trail:·
set number
set ruler

set splitright
set splitbelow
set title
set titleold=

set wildmenu


" Search
set ignorecase
set smartcase
set incsearch
set nohlsearch


" Indentation
set tabstop=4
set softtabstop=4
set sw=4
set expandtab


" Manual filetype stuff
autocmd FileType make setlocal noexpandtab

