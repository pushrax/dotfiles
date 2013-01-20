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
Bundle 'kien/ctrlp.vim'
let g:ctrlp_clear_cache_on_exit = 1
set wildignore+=*.o,.git,*.jpg,*.png,*.swp,*.d,*.gif,*.pyc,node_modules,*.class,*.crf,*.hg,*.orig,.meteor,*.acn,*.acr,*.alg,*.aux,*.bbl,*.blg,*.dvi,*.fdb_latexmk,*.glg,*.glo,*.gls,*.idx,*.ilg,*.ind,*.ist,*.lof,*.log,*.lot,*.maf,*.mtc,*.mtc0,*.nav,*.nlo,*.out,*.pdfsync,*.ps,*.snm,*.synctex.gz,*.toc,*.vrb,*.xdy,*.pdf,*.bcf,*.run.xml

set ignorecase
set smartcase
set incsearch
set nohlsearch


" Indentation
set tabstop=4
set softtabstop=4
set sw=4
set noexpandtab
set shiftround

filetype plugin on
filetype indent off

