" Name:     v_stup.vim
" Brief:    Personal vim initial setup
" Version:  1.0.0
" Date:     Tue 26 Jan 2010 11:48:34 AM CST
" Author:   Chen Zuopeng (EN: Daniel Chen)
" Email:    rlxtime.com@gmail.com 
"           chenzuopeng@gmail.com
"
" License:  Public domain, no restrictions whatsoever
"
" Copyright:Copyright (C) 2009-2010 Chen Zuopeng
"           Permission is hereby granted to use and distribute this code,
"           with or without modifications, provided that this copyright
"           notice is copied with it. Like anything else that's free,
"           bufexplorer.vim is provided *as is* and comes with no
"           warranty of any kind, either expressed or implied. In no
"           event will the copyright holder be liable for any damages
"           resulting from the use of this software.
"
" TODO:     
"
" NOTE:     
"

if exists("g:v_stup")
	finish
endif

let g:v_stup = 'true'

"Enable number
set nonu
function SetNumberCtrl()
   if &nu == 0
      set nu
   else
      set nonu
   endif
endfunction

function ToggerLang (language)
   set termencoding=utf-8
   if a:language == "jp"
       set encoding=utf8
       set fileencodings=iso-2022-jp,utf-8,euc-jp,cp932
       set termencoding=utf-8
       let $LANG='ja'
   endif
   if a:language == "zh-CN"
        set encoding=prc
        set fileencodings=utf-8,gb2312,gbk,gb18030
        set termencoding=utf-8
        let $LANG='zh-CN'
   endif 
   if expand("%") != ""
       :e
  endif
endfunction 

"Hex view
let s:isViewHex = 0
function ComRTViewHex ()
    if s:isViewHex == 0
        :%!xxd
        let s:isViewHex = 1
    else
        :%!xxd -r
        let s:isViewHex = 0
    endif
endfunction

"Key maps"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Search str in current file
":map <F3> :call SearchCurFile()<CR><Esc>
"Set number
map <F12> :call SetNumberCtrl()<cr>

"Save current Session
"if has ("win32")
"    :nmap <C-S> :wa<Bar>exe "mksession! " . v:this_session<CR>:so $VIM\sessions\
"else
"    :nmap <C-S> :wa<Bar>exe "mksession! " . v:this_session<CR>:so ~/sessions/
"endif

"Auto insert prevent mutiinclude macro and class structure to C\C++ language's
"head file
function AutoGenerateHeadFile ()
    let s:ifcond   = "#ifndef __"
    let s:cond     = "#define __"
    let s:endcond  = "#endif  //__"
    let s:macro_txt  = ""
    let s:class_name = ""
    let s:tmp_string = ""
    let s:file_name  = expand("%:p:t")
"    Remove postfix of XXXXX.h file
    let s:class_name = substitute(s:file_name, "\\.\.\*\$", "", "")
"    Remove character like : ' '
    let s:class_name = substitute(s:class_name, "\ ", "", "")

    let s:macro_txt = toupper(s:file_name)
"    Replace . to _
    let s:macro_txt = substitute(s:macro_txt, "\\.", "_", "")
    let s:tmp_string = s:ifcond . s:macro_txt
    call setline (1, s:tmp_string)
    let s:tmp_string = ""
    let s:tmp_string = s:cond . s:macro_txt
    call setline (2, s:tmp_string)
    call setline (3, "")
    call setline (4, "class " . s:class_name)
    call setline (5, "{")
    call setline (6, "    public:")
    call setline (7, "        " . s:class_name . "();")
    call setline (8, "        ~" . s:class_name . "();")
    call setline (9, "    protected:")
    call setline (10, "")
    call setline (11, "    private:")
    call setline (12, "")
    call setline (13, "};")
    call setline (14, "")
    let s:tmp_string = ""
    let s:tmp_string = s:endcond . s:macro_txt
    call setline (15, s:tmp_string)
endfunction

":au BufNewFile *.h call AutoGenerateHeadFile ()
au BufNewFile *.h :call AutoGenerateHeadFile ()
au BufNewFile *.hpp :call AutoGenerateHeadFile ()
"

