" 判断操作系统类型
if(has("win32") || has("win64"))
    let g:isWIN = 1
    let g:isMAC = 0
else
    if system("uname") =~ "Darwin"
        let g:isWIN = 0
        let g:isMAC = 1
    else
        let g:isWIN = 0
        let g:isMAC = 0
    endif
endif
" 判断是否处于GUI界面
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif
" 配置变量
if has("win32")
    let $VIMFILES = $VIM.'\vimfiles'
    let $V = $VIM.'\_vimrc'
else
    let $VIMFILES = $HOME.'\.vim'
    let $V = $HOME.'\.vimrc'
endif
"======================设置默认工作目录===========
if g:isWIN
    exec 'cd ' . fnameescape('f:\workspace') 
else 
    exec 'cd ' . fnameescape('~\workspace')
endif
"=================================================


set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim   "使用win系统习惯，注销即使用vim习惯
behave mswin        "使用win系统习惯，注销即使用vim习惯

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"=================================leader==========
"let mapleader="," "默认为\
"---------------------------------------------
" < 界面配置 >
"---------------------------------------------
" 设置通用缩进策略
set shiftwidth=4
set tabstop=4

" 对部分语言设置单独的缩进
au FileType groovy,scala,clojure,scheme,racket,lisp,lua,ruby,eruby,slim,elixir,julia,dart,coffee,jade,sh set shiftwidth=2
au FileType groovy,scala,clojure,scheme,racket,lisp,lua,ruby,eruby,slim,elixir,julia,dart,coffee,jade,sh set tabstop=2

" 根据后缀名指定文件类型
au BufRead,BufNewFile *.h        setlocal ft=c
au BufRead,BufNewFile *.m        setlocal ft=objc
au BufRead,BufNewFile *.di       setlocal ft=d
au BufRead,BufNewFile *.cl       setlocal ft=lisp
au BufRead,BufNewFile *.phpt     setlocal ft=php
au BufRead,BufNewFile *.inc      setlocal ft=php
au BufRead,BufNewFile *.sql      setlocal ft=mysql
au BufRead,BufNewFile *.tpl      setlocal ft=smarty
au BufRead,BufNewFile *.txt      setlocal ft=txt
au BufRead,BufNewFile hosts      setlocal ft=conf
au BufRead,BufNewFile http*.conf setlocal ft=apache
au BufRead,BufNewFile *.conf     setlocal ft=nginx
au BufRead,BufNewFile *.ini      setlocal ft=dosini
" 设置着色模式和字体
if g:isWIN
    colorscheme molokai
    set guifont=Monaco:h11
elseif g:isMAC
    colorscheme molokai
    set guifont=Monaco:h14
else
    colorscheme molokai
    set guifont=Monaco\ 11
endif

let g:autotheme_disable=1    "自动换主题,0为关闭

set backspace=2              " 设置退格键可用
set autoindent               " 自动对齐
set ai!                      " 设置自动缩进
set smartindent              " 智能自动缩进
set foldmethod=indent        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠
set nu!					     " 显示行号
"set relativenumber          " 开启相对行号
set mouse=a                  " 启用鼠标
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 开启实时搜索功能
set hlsearch                 " 开启高亮显示结果
set laststatus=2			 " 状态栏高度
set cmdheight=2				 " 状态栏行数
set cursorline				 " 高亮光标行
set shortmess=atI			 " 去掉启动广告
set nowrapscan               " 搜索到文件两端时不重新搜索
set hidden                   " 允许在有未保存的修改时切换缓冲区
set ignorecase smartcase	 " 查找时忽略大小写，当有至少一个大写字母时不忽略
set autochdir                " 设定文件浏览器目录为当前目录
set shiftwidth=4             " 换行时自动缩进宽度，可更改（宽度同tabstop）
set expandtab                " 将Tab自动转化成空格 [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set showmatch                " 显示括号配对情况
set smarttab                 " 指定按一次backspace就删除shiftwidth宽度
set guioptions-=L			 "  隐藏左右两侧的滑动滚动条
set guioptions-=r
set autoread                 " 当文件在外部被修改时自动更新该文件
set nobackup                 " 不生成备份文件
set noswapfile               " 不生成交换文件
syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全

" 重启后撤销历史可用 persistent undo 
set undofile
set undodir=$VIM\vimfiles\undodir
set undolevels=1000 "maximum number of changes that can be undone

" 使用GUI界面时的设置
if g:isGUI
    " 启动时自动最大化窗口
    if g:isWIN
        au GUIEnter * simalt ~x " 默认最大化
    endif
    "winpos 20 20            " 指定窗口出现的位置，坐标原点在屏幕左上角
    "set lines=20 columns=90 " 指定窗口大小，lines为高度，columns为宽度
    set guioptions+=c        " 使用字符提示框
    set guioptions-=m        " 隐藏菜单栏
    set guioptions-=T        " 隐藏工具栏
    set guioptions-=L        " 隐藏左侧滚动条
    set guioptions-=r        " 隐藏右侧滚动条
    set guioptions-=b        " 隐藏底部滚动条
    set showtabline=0        " 隐藏Tab栏
    set cursorline           " 高亮突出当前行
    "set cursorcolumn        " 高亮突出当前列
endif

set guioptions-=m			"F2召唤tools栏和菜单栏
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
\set guioptions-=T <Bar>
\set guioptions-=m <Bar>
\else <Bar>
\set guioptions+=T <Bar>
\set guioptions+=m <Bar>
\endif<CR>

" 设置文件编码和文件格式
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,mac,dos
if g:isWIN
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif
"---------------------------------------------
" < 编写文件配置 >
"---------------------------------------------
"以下是括号匹配
:inoremap ( ()<Esc>i
:inoremap ) <c-r>=ClosePair(')')<cr>
:inoremap { {}<Esc>i
:inoremap } <c-r>=ClosePair('}')<cr>
:inoremap [ []<Esc>i
:inoremap ] <c-r>=ClosePair(']')<cr>
:inoremap " ""<Esc>i
:inoremap ' ''<Esc>i

function ClosePair(char)
    if getline('.')[col('.')-1]== a:char
        return getline('.')[col('.')-1]
    else
        return a:char
    endif
endf
"---------------------------------------------
" < 快捷键配置 >
"---------------------------------------------
" F1 取消高亮
map <F1> :noh<CR>
imap <F1> <Esc>:noh<CR>
vmap <F1> <Esc>:noh<CR>

" ` 键保存
map ` :w!<CR>

" - 关闭语法错误框
map - :cclose<CR>

" = 另存为
map = :browse confirm saveas<CR>

" for buffer
map . :bn<CR>
map , :bp<CR>

"For NERDTree
map <F3> :exe 'NERDTreeToggle'<CR>
imap <F3> <Esc>:exe 'NERDTreeToggle'<CR>
vmap <F3> <Esc>:exe 'NERDTreeToggle'<CR>

"For TComment
map <c-d> :TComment<CR>

"查找和替换
map <c-f> :promptfind<CR>
map <M-f> :promptrepl<CR>

"一键换肤
map <F12> :call Changetheme()<CR>

"---------------------------------------------
" < 插件配置 >
"---------------------------------------------

"**************************
"for nerdtree
"**************************
"au VimEnter * NERDTree
let NERDTreeChDirMode=2 "选中root即设置为当前目录
let NERDTreeWinPos="left"
let NERDTreeWinSize=23
let NERDTreeQuitOnOpen=1 "打开文件时关闭树
let NERDTreeShowBookmarks=1 "显示书签
let NERDTreeDirArrows=0 "目录箭头 1 显示箭头  0传统+-|号

""""""""""""""""""""""""""""""  
" Vundle  
""""""""""""""""""""""""""""""  
filetype off " required! 
if g:isWIN
    set rtp+=$VIM/vimfiles/bundle/vundle/
    let path='$VIM/vimfiles/bundle'
else 
    set rtp+=~/.vim/bundle/vundle/
    let path='~/.vim/bundle'
endif

call vundle#begin(path) 
  
" let Vundle manage Vundle  
Plugin 'gmarik/vundle'  
  
" vim-scripts repos  
Plugin 'jsbeautify'
Plugin 'The-NERD-Commenter'
Plugin 'The-NERD-tree'
Plugin 'bling/vim-airline'
Plugin 'winmanager'
Plugin 'junegunn/vim-easy-align'
Plugin 'tomtom/tcomment_vim'
Plugin 'godlygeek/tabular' "文档对齐插件，功能比较吊= =，但是学习成本较高
Plugin 'plasticboy/vim-markdown'
Plugin 'othree/xml.vim'
Plugin 'kevinw/pyflakes-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'vimtweak'
Plugin 'https://github.com/schmich/vim-guifont'
Plugin 'dimasg/vim-mark'
Plugin 'kien/ctrlp.vim' 
Plugin 'OrangeT/vim-csharp'
Plugin 'rmartinho/vim-cpp11'
Plugin 'webfd/vim-cppstl'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'othree/html5.vim'
Plugin 'webfd/vimdoc-zh' "中文帮助文档
Plugin 'lilydjwg/colorizer' "css颜色
Plugin 'vimchina/vim-fencview' "自动识别文件编码
let g:fencview_autodetect=1
"------------------------------------------------------------------------------
Plugin 'vim-scripts/TxtBrowser'
"介绍详见http://guoyoooping.blog.163.com/blog/static/1357051832009112910162389/

au BufEnter *.txt setlocal ft=txt
"------------------------------------------------------------------------------
Plugin 'vim-scripts/taglist.vim'
Plugin 'Tagbar'
" -----------------------------------------------------------------------------
"  < Tagbar 插件配置 >
" -----------------------------------------------------------------------------
" 相对 TagList 能更好的支持面向对象

" 常规模式下输入 tb 调用插件，如果有打开 TagList 窗口则先将其关闭
nmap tb :TlistClose<CR>:TagbarToggle<CR>

let g:tagbar_compact = 1 "关闭顶部帮助提示
autocmd VimEnter * nested :call tagbar#autoopen(1)
let g:tagbar_foldlevel = 2
let g:tagbar_sort = 0
let g:tagbar_width=30                       "设置窗口宽度
"let g:tagbar_left=1                         "在左侧窗口中显示,默认右侧

" -----------------------------------------------------------------------------
"  < TagList 插件配置 >
" -----------------------------------------------------------------------------
" 高效地浏览源码, 其功能就像vc中的workpace
" 那里面列出了当前文件中的所有宏,全局变量, 函数名等

" 常规模式下输入 tl 调用插件，如果有打开 Tagbar 窗口则先将其关闭
nmap tl :TagbarClose<CR>:Tlist<CR>

let Tlist_Show_One_File=1                   "只显示当前文件的tags
" let Tlist_Enable_Fold_Column=0              "使taglist插件不显示左边的折叠行
let Tlist_Exit_OnlyWindow=1                 "如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_File_Fold_Auto_Close=1            "自动折叠
let Tlist_WinWidth=30                       "设置窗口宽度
let Tlist_Use_Right_Window=1                "在右侧窗口中显示
"------------------------------------------------------------------------------
Plugin 'scrooloose/syntastic' "语法检查软件，支持多种语言
let g:syntastic_check_on_open = 1 "设置为每次打开buffer就执行语法检查，而不只是在保存时

" -----------------------------------------------------------------------------
"  < indentLine 插件配置 >
" -----------------------------------------------------------------------------
Plugin 'vim-scripts/indentLine.vim' "对齐线
" 用于显示对齐线，与 indent_guides 在显示方式上不同，根据自己喜好选择了
" 在终端上会有屏幕刷新的问题，这个问题能解决有更好了
" 开启/关闭对齐线
"nmap <leader>il :IndentLinesToggle<CR>

" 设置Gvim的对齐线样式

 "  let g:indentLine_char = "┊"
 "  let g:indentLine_first_char = "┊"


" 设置终端对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
let g:indentLine_color_term = 239

" 设置 GUI 对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
let g:indentLine_color_gui = '#A4E57E'
"------------------------------------------------------------------------------
"****************************ultisnips*******************************
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


call vundle#end()

filetype plugin indent on
"-----------------------------------------------------------------------------

"********************************************************************
" -----------------------------------------------------------------------------
"  < vimtweak 工具配置 > 请确保以已装了工具
" -----------------------------------------------------------------------------
" 这里只用于窗口透明与置顶
" 常规模式下 Ctrl + Up（上方向键） 增加不透明度，Ctrl + Down（下方向键） 减少不透明度，<Leader>t 窗口置顶与否切换
if (g:isWIN && g:isGUI)
    let g:Current_Alpha = 255
    let g:Top_Most = 0
    func! Alpha_add()
        let g:Current_Alpha = g:Current_Alpha + 10
        if g:Current_Alpha > 255
            let g:Current_Alpha = 255
        endif
        call libcallnr("vimtweak.dll","SetAlpha",g:Current_Alpha)
    endfunc
    func! Alpha_sub()
        let g:Current_Alpha = g:Current_Alpha - 10
        if g:Current_Alpha < 155
            let g:Current_Alpha = 155
        endif
        call libcallnr("vimtweak.dll","SetAlpha",g:Current_Alpha)
    endfunc
    func! Top_window()
        if  g:Top_Most == 0
            call libcallnr("vimtweak.dll","EnableTopMost",1)
            let g:Top_Most = 1
        else
            call libcallnr("vimtweak.dll","EnableTopMost",0)
            let g:Top_Most = 0
        endif
    endfunc

    "快捷键设置
    nmap <c-up> :call Alpha_add()<CR>
    nmap <c-down> :call Alpha_sub()<CR>
    nmap <leader>t :call Top_window()<CR>
endif
"-------------------------------------------------------------
"**************************
"for airline
"**************************
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'badwolf'
"**************************
"for easy-align
"**************************
vnoremap <silent> <Enter> :EasyAlign<CR>

"**************************
"for comment
"**************************
map <c-d> gcc
"**************************
"for markdown
"**************************
let g:vim_markdown_folding_disable=1
let g:vim_markdown_initial_foldlevel=1
let g:vim_markdown_no_default_key_mapping=1

"**************************
"For Ycm
"**************************
let g:ycm_global_ycm_extra_conf = 'E:\vim\vimfiles\bundle\YouCompleteMe\python\.ycm_extra_conf.py'
" 设置转到定义处的快捷键为ALT + G，这个功能非常赞 
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR> 
" 补全功能在注释中同样有效 
let g:ycm_complete_in_comments=1  
" 从第一个键入字符就开始罗列匹配项 
let g:ycm_min_num_of_chars_for_completion=2
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"重定义触发键
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']


"==========================guifont++===============
"让vim像IDE一样一键放大缩小字号
let guifontpp_size_increment=1 "每次更改的字号
let guifontpp_smaller_font_map="<M-Down>" 
let guifontpp_larger_font_map="<M-Up>" 
let guifontpp_original_font_map="<M-Home>"
