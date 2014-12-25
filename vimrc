execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme flattown

if has('gui_running')
	set guifont=DejaVu\ Sans\ Mono\ Book\ 8
endif

:noremap ; :

"-- Spaces and tabs
set tabstop=4		" number of visual spaces per tab
set softtabstop=4	" number of spaces in tab when editting
set shiftwidth=4
set expandtab		" tabs as spaces

"-- UI config
set number			" show line numbers
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set showmatch       " highlight matching [{()}]

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

"-- Leader shortcuts
let mapleader = "," " leader is ','

