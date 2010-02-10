"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Vim script 
"Create by YaoXiong
"Create time 2010-02-10 14:58:37
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Copy right (c) YaoXiong
"Email: iori.hsiun@gmail.com
"Authorization:any can use modify, use, reissue it.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ts=4
set sw=4
set softtabstop=4
set textwidth=80
set cindent
set autoindent
set incsearch
set hlsearch
set smartindent
set ruler
set nobackup
set nowritebackup
set history=100
set showcmd

filetype plugin indent on
set fileformat=unix
set expandtab

"colorscheme ansi_blows
"colorscheme xterm16
"colorscheme 256-jungle
"colorscheme putty
"colorscheme lucius
"colorscheme oceandeep
"colorscheme peaksea
"colorscheme af
"colorscheme BlackSea
"colorscheme candycode
"colorscheme colorscheme_template
"colorscheme contrasty
"colorscheme dante
"colorscheme darkzen

"==================================
" key mapping
"==================================
map <F9> :!find ./ -name '*.cpp' -or -name '*.[chS]'>./cscope.files && cscope -bkq -i cscope.files && rm -f cscope.files<CR>
"if !exists(':命令名')
"command! -nargs=0 命令名 :!find ./ -name '*.cpp' -or -name '*.[chS]'>./cscope.files && cscope -bkq -i cscope.files && rm -f cscope.files <CR>


"this script use to excute make in vim and open quickfix window
nmap B :call Do_make()<cr><cr><cr>
nmap C :cclose<cr>
function Do_make()
   let filename = bufname("%")
   let suffix_pos = stridx(filename, ".c")
   if suffix_pos == -1  
      return
   else
      let target = strpart(filename,0,suffix_pos)
   endif
   let target = "make " . target

   execute target
   execute "copen"
endfunction

"==================================
" BufExplorer
"==================================
let g:bufExplorerDefaultHelp=0 " Do not show default help.
let g:bufExplorerDetailedHelp=0 " Do not show detailed help.
let g:bufExplorerShowRelativePath=0 " Show absolute paths.
let g:bufExplorerShowDirectories=1 " Show directories.
let g:bufExplorerSortBy='mru' " Sort by most recently used.
let g:bufExplorerSplitRight=0 " Split left.
let g:bufExplorerSplitVertical=1 " Split vertically.
let g:bufExplorerSplitVertSize = 30 " Split width
let g:bufExplorerUseCurrentWindow=1 " Open in new window.

"===========================
" MiniBuf setting
"===========================
"let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1

"===========================
" winManager setting
"===========================
let g:winManagerWindowLayout = 'BufExplorer,FileExplorer|TagList'
"let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer' " What windows should it
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<CR>
nmap <C-W><C-B> :BottomExplorerWindow<CR>
"nmap <silent> <leader>wm :WMToggle<CR>
nnoremap <silent> <F8> :WMToggle<CR>

"==========================
" Tlist setting
"==========================
let Tlist_Sort_Type = "name" " order by
let Tlist_Use_Right_Window = 1 " split to the right side of the screen
let Tlist_Compart_Format = 1 " show small meny
let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill yourself
let Tlist_File_Fold_Auto_Close = 1 " Do not close tags for other files
let Tlist_Enable_Fold_Column = 0 " Do not show folding tree
let Tlist_WinHeight = 40
"nnoremap <silent> <F8> :TlistToggle<CR>

"==========================
" auto complete the words
"==========================
inoremap <F4> <C-x><C-o>

"==========================
" close the tab window
"==========================
map <F3> :close <CR>

"let g:winManagerWindowLayout = 'NERD_tree,taglist|BufExplorer'
"let g:winManagerWindowLayout = 'FileExplorer|Taglist'
"let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer'
"nmap wm :WMToggle<cr>
"let g:winManagerWindowLayout = "FileExplorer"
"let g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer'
"let g:NERDTree_title = "[NERDTree]"
"function! NERDTree_Start()
"call g:NERDTree()
"endfunction
"
"function! NERDTree_IsValid()
"return 1
"endfunction
"
"let g:winManagerWindowLayout='NERDTree|TagList'
"let g:winManagerWindowLayout = "NERDTree,TagList|TagList"
"let g:winManagerWindowLayout = "NERDTree,taglist|taglist"
"let g:NERDTree_title = "[NERDTree]"
"function! NERDTree_Start()
"	NERDTree
"endfunction
"function! NERDTree_IsValid()
"	return 1
"endfunction
"
"let g:taglist_title = "[Tlist]"
"function! taglist_Start()
"	call Tlist
"endfunction
"function! taglist_IsValid()
"	return 1
"endfunction

let OmniCpp_GlobalScopeSearch = 1  " 0 or 1
let OmniCpp_NamespaceSearch = 1   " 0 ,  1 or 2
let OmniCpp_DisplayMode = 1
let OmniCpp_ShowScopeInAbbr = 0
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std"]

"let g:SuperTabRetainCompletionType = 2
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"==========================
" DoxygenToolkit setting
"==========================
"let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
"let g:DoxygenToolkit_paramTag_pre="@Param "
"let g:DoxygenToolkit_returnTag="@Returns   "
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
"let g:DoxygenToolkit_authorName="xiongyao"
"let g:DoxygenToolkit_licenseTag="My own license"   <-- !!! Does not end with "\<enter>"
"let g:doxygenToolkit_briefTag_funcName="yes"

" Open and close all the three plugins on the same time
nmap <F8>   :TrinityToggleAll<CR>
" Open and close the srcexpl.vim separately
"nmap <F9>   :TrinityToggleSourceExplorer<CR>
" Open and close the taglist.vim separately
nmap <F10>  :TrinityToggleTagList<CR>
" Open and close the NERD_tree.vim separately
nmap <F11>  :TrinityToggleNERDTree<CR>


"let g:vimgdb_debug_file = ""
"run macros/gdb_mappings.vim
