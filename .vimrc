set nocompatible
set nomodeline
filetype off

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp932,cp936,big5,sjis,euc-jp,euc-kr,gb18030,latin1,default
set spelllang=en_ca

source ~/.vim/plug/plug.vim
call plug#begin('~/.vim/plugins')


" Colours
set t_Co=16
set background=dark
colorscheme kantan
set guifont=Meslo\ LG\ S:h12


" Languages
Plug 'digitaltoad/vim-jade'
Plug 'hail2u/vim-css3-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-haml'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'wavded/vim-stylus'
Plug 'petRUShka/vim-opencl'
Plug 'derekwyatt/vim-scala'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'smerrill/vcl-vim-plugin'
Plug 'wting/rust.vim'
Plug 'fatih/vim-go'
Plug 'tikhomirov/vim-glsl'
Plug 'beyondmarc/hlsl.vim'


" Tools
Plug 'tpope/vim-fugitive'
Plug 'jamessan/vim-gnupg'
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-signify'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'

function SetGPGOptions()
  set paste
  set ts=2 sts=2 sw=2 expandtab
endfunction
autocmd User GnuPG call SetGPGOptions()


" Display
if version < 700
  set list listchars=tab:>\ ,trail:-
else
  set list listchars=tab:▸\ ,trail:·
endif
set number
set ruler
set cursorline
set nowrap
set linebreak

set splitright
set splitbelow
set title
set titleold=

set wildmenu

" Just for a sanity check
if exists('+colorcolumn')
  set colorcolumn=80
endif


" Statusline
set laststatus=2
set noshowmode

let g:airline_theme='powerlineish'
let g:airline_powerline_fonts=0

let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = '+++'

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" Search
Plug 'rking/ag.vim'

Plug 'junegunn/fzf', {'dir': '~/dotfiles/fzf/'}
noremap <silent> <C-T> :FZF<CR>

if g:use_light_conf
  Plug 'vim-scripts/AutoComplPop'
else
  Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
  nnoremap <Leader>jd :YcmCompleter GoTo<CR>
  nnoremap <Leader>jf :YcmCompleter GoToDeclaration<CR>
  nnoremap <Leader>ji :YcmCompleter GoToInclude<CR>
endif

set ignorecase
set smartcase
set incsearch
set nohlsearch
set tags=./tags;/


" Control
set hidden
noremap <c-n> :bn<CR>
noremap <c-p> :bp<CR>
nnoremap <Leader>q :bdelete<cr>
set mouse=a
set mousehide
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <Space> <Leader>


" Indentation
set tabstop=4
set softtabstop=4
set sw=4
set noexpandtab
set shiftround

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey10 ctermbg=NONE
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey15 ctermbg=0

vnoremap < <gv
vnoremap > >gv


" Misc tweaks
let g:netrw_home=$HOME.'/.vim'
set backspace=2
set timeoutlen=1000 ttimeoutlen=0
set history=100
set autoread
set scrolloff=8
set viminfo=

if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

call plug#end()


" These need to come after all plugin imports
filetype plugin on
filetype plugin indent on
syntax on
highlight clear SignColumn

if filereadable($HOME.'/.local.vim')
	source $HOME/.local.vim
endif

