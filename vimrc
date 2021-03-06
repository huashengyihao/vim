set nocompatible              " be iMproved
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() " used in mac
" call vundle#rc() " used in ubuntu
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'  "文件浏览
Plugin 'majutsushi/tagbar'    "代码符号
Plugin 'wesleyche/SrcExpl'    "类似sourceInsight的代码预览窗口
Plugin 'Valloric/YouCompleteMe'
" Plugin 'Xuyuanp/nerdtree-git-plugin'

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" riginal repos on github
Bundle 'kien/ctrlp.vim'
Bundle 'sukima/xmledit'
Bundle 'sjl/gundo.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'klen/python-mode'
Plugin 'davidhalter/jedi'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Valloric/ListToggle'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/syntastic'
Bundle 't9md/vim-quickhl'
" Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
"..................................
" vim-scripts repos
Bundle 'YankRing.vim'
Bundle 'vcscommand.vim'
Bundle 'ShowPairs'
Bundle 'SudoEdit.vim'
Bundle 'EasyGrep'
Bundle 'VOoM'
Bundle 'VimIM'


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"
" All of your Plugins must be added before the following line
call vundle#end()            " required, used in mac
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

nmap <F4> :SrcExplToggle<CR>
let g:Srcexpl_winHeight = 10
" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 50
" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>"
" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_pluginList = [
         \ "__Tag_List__",
                 \ "_NERD_tree_"
                     \ ]

" 基本配置
set nu
syntax on
set noeb
set vb t_vb=
set mouse=a
autocmd InsertEnter * se cul
set ruler
set showcmd
set cmdheight=1
set tabstop=4

" YCM 
" 自动补全配置
set completeopt=longest,menu
" "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" "回车即选中当前项
" "上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" :"\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
"
" youcompleteme  默认tab  s-tab 和自动补全冲突
" let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1    " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2    "
" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0    " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>    "force recomile with syntastic

"nnoremap <leader>lo :lopen<CR>    "open locationlist
"nnoremap <leader>lc :lclose<CR>    "close locationlist
inoremap <leader><leader> <C-x><C-o>
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> "
" 跳转到定义处

" taglist "
Bundle 'taglist.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1                "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                    "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1              "如果taglist窗口是最后一个窗口，则退出vim
" let Tlist_Use_Right_Window=1           "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Windo =1              "在左侧窗口中显示taglist窗口off required
" let Tlst_Enable_Fold_Column = 0    		 " 不要显示折叠树 "
" let Tlist_Auto_Open=1
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
set tags=tags;/  "搜索上建立的tag
let g:tagbar_left = 0
nnoremap <F3> :TagbarToggle<CR>


" nerdtree "
" " NERDTree setting defaults to work around
" http://github.com/scrooloose/nerdtree/issues/489
let NERDTreeWinPos = 'left'
let NERDTreeWinSize = 30
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly = "RO"
let g:NERDTreeShowIgnoredStatus = 1

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplModSelTarget = 1

map <F5> :call CompileRunGcc()<CR>
nmap <C-H> <C-W>h "control+h进入左边的窗口
nmap <C-J> <C-W>j  "control+j进入下边的窗口
nmap <C-K> <C-W>k "control+k进入上边的窗口
nmap <C-L> <C-W>l  "control+l进入右边的窗口

func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java' 
	        exec "!javac %" 
	        exec "!java %<"
     	elseif &filetype == 'sh'
       		:!./%
        endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"

endfunc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 实用设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>


"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
" 定义函数SetTitle，自动插入文件头 
func SetTitle() 
	" 如果文件类型为.sh文件  
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
        	call append(line("."), "\# File Name: ".expand("%")) 
        	call append(line(".")+1, "\# Author: Yu Xian") 
		call append(line(".")+2, "\# mail: watson_yx@163.com") 
		" 原来的时间形式比较复杂，不喜欢，改变一下
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        	call append(line(".")+3, "\# Created Time: "".strftime("%Y-%m-%d",localtime()))
		call append(line(".")+4, "\#########################################################################") 
        	call append(line(".")+5, "\#!/bin/bash") 
        	call append(line(".")+6, "") 
	else 
	        call setline(1, "/*************************************************************************") 
	        call append(line("."), "    > File Name: ".expand("%")) 
	        call append(line(".")+1, "    > Author: Yu Xian") 
	        call append(line(".")+2, "    > Mail: watson_yx@163.com") 
	        " 同样的 改变时间格式
	        call append(line(".")+3, "    > Created Time: ".strftime("%Y-%m-%d",localtime()))
	        call append(line(".")+4, " ************************************************************************/") 
	        call append(line(".")+5, "")
        endif
	    if &filetype == 'cpp'
	        call append(line(".")+6, "#include<iostream>")
	        call append(line(".")+7, "using namespace std;")
	        call append(line(".")+8, "")
	    endif
	    if &filetype == 'c'
	        call append(line(".")+6, "#include<stdio.h>")
	        call append(line(".")+7, "")
	    endif
	    "新建文件后，自动定位到文件末尾
	    autocmd BufNewFile * normal G
endfunc 
 
" Suzzz：  模仿上面，新建python文件时，添加文件头
autocmd BufNewFile *py exec ":call SetPythonTitle()"
func SetPythonTitle()
     call setline(1,"#!/usr/bin/env python")
     call append( line("."),"#-*- coding: utf-8 -*-"  )
     call append(line(".")+1," ")
     call append(line(".")+2, "\# File Name: ".expand("%")) 
     call append(line(".")+3, "\# Author: Yu Xian") 
     call append(line(".")+4, "\# mail: Watson") 
call append(line(".")+5, "\# Created Time: ".strftime("%Y-%m-%d",localtime()))    
endfunc


set completeopt=longest,menu

