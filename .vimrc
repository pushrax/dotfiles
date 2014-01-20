set nocompatible
set nomodeline
filetype off

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp932,cp936,big5,euc-jp,euc-kr,gb18030,latin1,default

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'


" Colours
set t_Co=16
set background=dark
colorscheme kantan
set guifont=Meslo\ LG\ S:h12


" Languages
Bundle 'digitaltoad/vim-jade'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-haml'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'wavded/vim-stylus'
Bundle 'nathanaelkane/vim-indent-guides'

if !empty($GOROOT)
  set rtp+=$GOROOT/misc/vim
else
  Bundle 'jnwhiteh/vim-golang'
endif

" Tools
Bundle 'tpope/vim-fugitive'
Bundle 'jamessan/vim-gnupg'
Bundle 'scrooloose/nerdtree'
Bundle 'mhinz/vim-signify'
Bundle 'Raimondi/delimitMate'
Bundle 'tpope/vim-commentary'
Bundle 'vim-scripts/AutoComplPop'

autocmd User GnuPG set paste

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
Bundle 'bling/vim-airline'

" Search
Bundle 'kien/ctrlp.vim'

set wildignore+=*.o,.git,*.jpg,*.png,*.swp,*.d,*.gif,*.pyc,node_modules,*.class,*.crf,*.hg,*.orig,.meteor,*.acn,*.acr,*.alg,*.aux,*.bbl,*.blg,*.dvi,*.fdb_latexmk,*.glg,*.glo,*.gls,*.idx,*.ilg,*.ind,*.ist,*.lof,*.log,*.lot,*.maf,*.mtc,*.mtc0,*.nav,*.nlo,*.out,*.pdfsync,*.ps,*.snm,*.synctex.gz,*.toc,*.vrb,*.xdy,*.pdf,*.bcf,*.run.xml

let g:ctrlp_map = '<c-t>'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_switch_buffer = 'Et'
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<cr>'],
  \ 'AcceptSelection("t")': ['<c-t>'],
  \ }
let g:ctrlp_max_height = 12
let g:path_to_matcher = "~/.vim/matcher"
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -co --exclude-standard']
let g:ctrlp_match_func = { 'match': 'GoodMatch' }

function! GoodMatch(items, str, limit, mmode, ispath, crfile, regex)
  " create cache
  let cachefile = ctrlp#utils#cachedir().'/matcher.cache'
  if !( filereadable(cachefile) && a:items == readfile(cachefile) )
    call writefile(a:items, cachefile)
  endif
  if !filereadable(cachefile)
    return []
  endif

  " a:mmode is ignored
  let cmd = g:path_to_matcher.' --limit '.a:limit.' --manifest '.cachefile.' '
  if !( exists('g:ctrlp_dotfiles') && g:ctrlp_dotfiles )
    let cmd = cmd.'--no-dotfiles '
  endif
  let cmd = cmd.a:str

  return split(system(cmd), "\n")
endfunction

nmap <unique> <Leader>cc :CtrlPClearAllCaches<CR>

set ignorecase
set smartcase
set incsearch
set nohlsearch

Bundle 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'

set tags=./tags;/


" Navigation remappings
set hidden
noremap <c-n> :bn<CR>
noremap <c-p> :bp<CR>


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


" Misc fixes
let g:netrw_home=$HOME.'/.vim'
set backspace=2
set timeoutlen=1000 ttimeoutlen=0

com W w " I am a sinner
com Wq wq

" These need to come after all Bundle imports
filetype plugin on
filetype plugin indent on
syntax on

if filereadable($HOME.'/.local.vim')
	source $HOME/.local.vim
endif

