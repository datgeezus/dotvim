" vim:fdm=marker
" vim-plug {{{
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'Rykka/riv.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-speeddating'
" Plug 'vimwiki/vimwiki'
Plug 'leafgarland/typescript-vim'
Plug 'jceb/vim-orgmode'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()
" }}}
syntax on
filetype plugin indent on
set nocompatible

if has('gui_running')
    if has("win32")
        " set guifont=Inconsolata:h10
        " set guifont=Consolas:h10
        set guifont=DejaVu\ Sans\ Mono:h8
        source $VIMRUNTIME/mswin.vim
        behave mswin
    else
        set guifont=DejaVu\ Sans\ Mono\ Book\ 8
    endif

    set guioptions -=T          " Hide the toolbar
    set guioptions-=r           "remove right scroll bar
    set guioptions-=L           "remove left scroll bar
    set lines=100 columns =100  " Initial window size
endif

""" REMAPS
noremap ; :
map <space> <leader>
let maplocalleader=","
inoremap jk <ESC>


" quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
"-- Spaces and tabs
set tabstop=4       " number of visual spaces per tab
set softtabstop=4   " number of spaces in tab when editting
set shiftwidth=4
set expandtab       " tabs as spaces

" Temp files
if !isdirectory($HOME."/Documents/_vimtemp")
    call mkdir($HOME."/Documents/_vimtemp", "p")
endif
set backupdir=$HOME/Documents/_vimtemp//
set directory=$HOME/Documents/_vimtemp//

"-- UI config
set encoding=utf-8      " encoding
set number              " show line numbers
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set hidden              " hidden buffers
set showmatch           " highlight matching [{()}]
set t_Co=256            " Colors
set background=dark     " dark background
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme gruvbox
set list
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<
set colorcolumn=80

"-- Search
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set ignorecase      " case-sensitive search intelligently
set smartcase       "
" normal regex
nnoremap / /\v
vnoremap / /\v
" turn off highlight
nnoremap <leader><space> :nohlsearch<CR>
" move along brackets
nnoremap <tab> %
vnoremap <tab> %

" MOVEMENT {{{
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to the beginning/end of line
"nnoremap B ^
"nnoremap E $
" bubble single lines
nmap <up>   [e
nmap <down> ]e
" bubble multiple lines
vmap <up>   [egv
vmap <down> ]egv
" move lines horizontally
nmap <left>  <<
nmap <right> >>
vmap <left>  <'[V']
vmap <right> >'[V']
" window-movements
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" window split
nmap <leader>s :split<CR>
imap <leader>s :split<CR>
nmap <leader>v :vsplit<CR>
imap <leader>v :vsplit<CR>
" buffer movement
map <C-PageDown>    :bnext<CR>
map <C-PageUp>  :bprev<CR>
map <leader>l   :bnext<CR>
map <leader>h   :bprev<CR>
map <leader>x   :bd<CR>
map <C-n> :bnext<CR>
map <C-N> :bprev<CR>
map <C-x> :bd<CR>
" centner next/prev search item
nmap n nzz
nmap N Nzz
" }}}

" MISC {{{
" folds
set foldmethod=syntax
set foldlevelstart=99
" get current path
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
" edit file in current window, h-split, v-split, tab
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" toggle between relative and absolute line numbers
nnoremap <F3> :set relativenumber!<CR>
" }}}

" PLUGINS {{{
" - Lighline {{{
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveStatusline'
      \ },
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'VL',
      \   "\<C-v>": 'VB',
      \   'c' : 'C',
      \   's' : 'S',
      \   'S' : 'SL',
      \   "\<C-s>": 'SB',
      \   't': 'T',
      \ },
      \ }
"   }}}
set noshowmode
" - Indent Line {{{
let g:indentLine_char = '┆'
let g:indentLine_color_term = 240
let g:indentLine_color_gui = '#7070b0'
"   }}}
" - FZF {{{
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap \ :Rg<CR>
nnoremap <C-t> :Files<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>b  :Buffers<CR>
nnoremap <leader>/  :BLines<CR>
"   }}}
" - Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
autocmd VimEnter * SyntasticToggleMode " disable syntastic by default
"   }}}
" - GitGutter {{{
let g:gitgutter_enabled = 0
nnoremap <leader>g :GitGutterToggle<CR>
"   }}}
" - Riv {{{
let g:riv_fold_auto_update = 0
let g:riv_disable_folding = 1
"   }}}
" - vimtex {{{
let g:tex_flavor = 'latex'
"   }}}
" }}}

" Orgmode {{{
let g:org_agenda_files = ['~/org/*.org']
" }}}

" Autogorups {{{
augroup configgroup
    autocmd!
    " autocmd BufEnter * highlight OverLength ctermbg=darkgray guibg=#592929
    " autocmd BufEnter * match OverLength /\%80v.*/
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python setlocal foldnestmax=1
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown   " .md files as markdown
    autocmd BufEnter *.xaml setlocal filetype=xml
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufNewFile,BufRead *.xml setlocal tabstop=2
    autocmd BufNewFile,BufRead *.xml setlocal background=light
    autocmd BufNewFile,BufRead *.xml setlocal shiftwidth=2
    autocmd BufNewFile,BufRead *.xml setlocal softtabstop=2
    autocmd BufNewFile,BufRead *.xml setlocal nowrap
    autocmd BufNewFile,BufRead *.json setlocal tabstop=2
    autocmd BufNewFile,BufRead *.json setlocal shiftwidth=2
    autocmd BufNewFile,BufRead *.json setlocal softtabstop=2
    autocmd BufEnter *.rst setlocal colorcolumn+=100
augroup END
" }}}
