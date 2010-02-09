"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vim script 
"Create by ChenZuopeng
"Create time 2007-10-27 1:58:37
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Copy right (c) ChenZuopeng
"Email: rlxtime.com@gmail.com chenzuopeng@gmail.com
"Authorization:any can use modify, use, reissue it.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent
set shiftwidth=4
set nobackup
set nowritebackup
set history=100
set showcmd
set incsearch

syntax on
if &t_Co > 2 || has("gui_running")
    :set hlsearch
endif

set incsearch
set hlsearch
filetype plugin indent on
set fileformat=unix
set expandtab
set tabstop=4
set softtabstop=4


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set color scheme
":if has("gui")
"    :colorscheme lucius
":else
"    :colorscheme desert
":endif
colorscheme desert
if has("gui")
    set guifont=Courier\ New\ 12
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Initial ctags
if $TAGS_PATH != ""
    set tags=$TAGS_PATH
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Key maps"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Insert current time format yy-mm-dd hh:mm:ss
map <F2> a<C-R>=strftime("%c")<CR><Esc>
"List the recently opened files
"Need MRU plugin [http://www.vim.org/scripts/script.php?script_id=521]
map <F4> :MRU<cr>
"TlistToggle
"Need taglist plugin [http://www.vim.org/scripts/script.php?script_id=273]
map <F6> :TlistToggle<cr>

if has ("gui")
    set go=
endif

"EOF"
