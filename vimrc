execute pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible

if has('gui_running')
	set guifont=DejaVu\ Sans\ Mono\ Book\ 8
endif

""" REMAPS
noremap ; :
map <space> <leader>
" insert tab
vnoremap > >gv
" delete tab
vnoremap < <gv

" quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

"-- Spaces and tabs
set tabstop=4		" number of visual spaces per tab
set softtabstop=4	" number of spaces in tab when editting
set shiftwidth=4
set expandtab		" tabs as spaces

"-- UI config
set encoding=utf-8  " encoding
set number			" show line numbers
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set showmatch       " highlight matching [{()}]
set background=dark " dark background
set t_Co=256        " Colors
colorscheme iceberg  


"-- Searching
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
" turn off highlight
nnoremap <leader><space> :nohlsearch<CR>

"-- Movement
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to the beginning/end of line
"nnoremap B ^
"nnoremap E $

"-- Misc
autocmd BufNewFile,BufReadPost *.md set filetype=markdown   " .md files as markdown

""" PLUGINS
"-- Airline
" UI
let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : 'N',
      \ 'i'  : 'I',
      \ 'R'  : 'R',
      \ 'c'  : 'C',
      \ 'v'  : 'V',
      \ 'V'  : 'V-L',
      \ '' : 'V-B',
      \ 's'  : 'S',
      \ 'S'  : 'S-L',
      \ }
let g:airline_theme             = 'powerlineish'
let g:airline_enable_syntastic  = 1
" Buffers
let g:airline#extensions#tabline#enabled = 1        " enable buffers
let g:airline#extensions#tabline#left_sep = ' '     " 
let g:airline#extensions#tabline#left_alt_sep = '|' " 
let g:airline#extensions#tabline#fnamemod = ':t'    " show only names
" Separator symbols
let g:airline_left_sep = '❯'    " Left separator
let g:airline_right_sep = '❮'   " Right separator
" Whitespace
let g:airline#extensions#whitespace#enabled = 1     " enable detection of whitespace
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]

"-- Indent Line
let g:indentLine_char = '︙'
