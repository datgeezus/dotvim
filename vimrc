execute pathogen#infect()
syntax on
filetype plugin indent on

if has('gui_running')
	set guifont=DejaVu\ Sans\ Mono\ Book\ 8
endif

""" REMAPS
:noremap ; :
:map <space> <leader>

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
set number			" show line numbers
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set showmatch       " highlight matching [{()}]
set background=dark " dark background
set t_Co=256        " Colors
"colorscheme flattown
"colorscheme flattr
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
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
