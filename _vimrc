" �жϲ���ϵͳ����
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
" �ж��Ƿ���GUI����
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif
" ���ñ���
if has("win32")
    let $VIMFILES = $VIM.'\vimfiles'
    let $V = $VIM.'\_vimrc'
else
    let $VIMFILES = $HOME.'\.vim'
    let $V = $HOME.'\.vimrc'
endif
"======================����Ĭ�Ϲ���Ŀ¼===========
if g:isWIN
    exec 'cd ' . fnameescape('f:\workspace') 
else 
    exec 'cd ' . fnameescape('~\workspace')
endif
"=================================================


set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim   "ʹ��winϵͳϰ�ߣ�ע����ʹ��vimϰ��
behave mswin        "ʹ��winϵͳϰ�ߣ�ע����ʹ��vimϰ��

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
"let mapleader="," "Ĭ��Ϊ\
"---------------------------------------------
" < �������� >
"---------------------------------------------
" ����ͨ����������
set shiftwidth=4
set tabstop=4

" �Բ����������õ���������
au FileType groovy,scala,clojure,scheme,racket,lisp,lua,ruby,eruby,slim,elixir,julia,dart,coffee,jade,sh set shiftwidth=2
au FileType groovy,scala,clojure,scheme,racket,lisp,lua,ruby,eruby,slim,elixir,julia,dart,coffee,jade,sh set tabstop=2

" ���ݺ�׺��ָ���ļ�����
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
" ������ɫģʽ������
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

let g:autotheme_disable=1    "�Զ�������,0Ϊ�ر�

set backspace=2              " �����˸������
set autoindent               " �Զ�����
set ai!                      " �����Զ�����
set smartindent              " �����Զ�����
set foldmethod=indent        " ѡ������۵�����
set foldlevel=100            " ��ֹ�Զ��۵�
set nu!					     " ��ʾ�к�
"set relativenumber          " ��������к�
set mouse=a                  " �������
set ruler                    " ���½���ʾ���λ�õ�״̬��
set incsearch                " ����ʵʱ��������
set hlsearch                 " ����������ʾ���
set laststatus=2			 " ״̬���߶�
set cmdheight=2				 " ״̬������
set cursorline				 " ���������
set shortmess=atI			 " ȥ���������
set nowrapscan               " �������ļ�����ʱ����������
set hidden                   " ��������δ������޸�ʱ�л�������
set ignorecase smartcase	 " ����ʱ���Դ�Сд����������һ����д��ĸʱ������
set autochdir                " �趨�ļ������Ŀ¼Ϊ��ǰĿ¼
set shiftwidth=4             " ����ʱ�Զ�������ȣ��ɸ��ģ����ͬtabstop��
set expandtab                " ��Tab�Զ�ת���ɿո� [��Ҫ����������Tab��ʱ��ʹ�� Ctrl+V + Tab]
set showmatch                " ��ʾ����������
set smarttab                 " ָ����һ��backspace��ɾ��shiftwidth���
set guioptions-=L			 "  ������������Ļ���������
set guioptions-=r
set autoread                 " ���ļ����ⲿ���޸�ʱ�Զ����¸��ļ�
set nobackup                 " �����ɱ����ļ�
set noswapfile               " �����ɽ����ļ�
syntax enable                " ���﷨����
syntax on                    " �����ļ��������
filetype indent on           " ��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ
filetype plugin on           " ��Բ�ͬ���ļ����ͼ��ض�Ӧ�Ĳ��
filetype plugin indent on    " �����Զ���ȫ

" ����������ʷ���� persistent undo 
set undofile
set undodir=$VIM\vimfiles\undodir
set undolevels=1000 "maximum number of changes that can be undone

" ʹ��GUI����ʱ������
if g:isGUI
    " ����ʱ�Զ���󻯴���
    if g:isWIN
        au GUIEnter * simalt ~x " Ĭ�����
    endif
    "winpos 20 20            " ָ�����ڳ��ֵ�λ�ã�����ԭ������Ļ���Ͻ�
    "set lines=20 columns=90 " ָ�����ڴ�С��linesΪ�߶ȣ�columnsΪ���
    set guioptions+=c        " ʹ���ַ���ʾ��
    set guioptions-=m        " ���ز˵���
    set guioptions-=T        " ���ع�����
    set guioptions-=L        " ������������
    set guioptions-=r        " �����Ҳ������
    set guioptions-=b        " ���صײ�������
    set showtabline=0        " ����Tab��
    set cursorline           " ����ͻ����ǰ��
    "set cursorcolumn        " ����ͻ����ǰ��
endif

set guioptions-=m			"F2�ٻ�tools���Ͳ˵���
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
\set guioptions-=T <Bar>
\set guioptions-=m <Bar>
\else <Bar>
\set guioptions+=T <Bar>
\set guioptions+=m <Bar>
\endif<CR>

" �����ļ�������ļ���ʽ
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
" < ��д�ļ����� >
"---------------------------------------------
"����������ƥ��
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
" < ��ݼ����� >
"---------------------------------------------
" F1 ȡ������
map <F1> :noh<CR>
imap <F1> <Esc>:noh<CR>
vmap <F1> <Esc>:noh<CR>

" ` ������
map ` :w!<CR>

" - �ر��﷨�����
map - :cclose<CR>

" = ���Ϊ
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

"���Һ��滻
map <c-f> :promptfind<CR>
map <M-f> :promptrepl<CR>

"һ������
map <F12> :call Changetheme()<CR>

"---------------------------------------------
" < ������� >
"---------------------------------------------

"**************************
"for nerdtree
"**************************
"au VimEnter * NERDTree
let NERDTreeChDirMode=2 "ѡ��root������Ϊ��ǰĿ¼
let NERDTreeWinPos="left"
let NERDTreeWinSize=23
let NERDTreeQuitOnOpen=1 "���ļ�ʱ�ر���
let NERDTreeShowBookmarks=1 "��ʾ��ǩ
let NERDTreeDirArrows=0 "Ŀ¼��ͷ 1 ��ʾ��ͷ  0��ͳ+-|��

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
Plugin 'godlygeek/tabular' "�ĵ������������ܱȽϵ�= =������ѧϰ�ɱ��ϸ�
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
Plugin 'webfd/vimdoc-zh' "���İ����ĵ�
Plugin 'lilydjwg/colorizer' "css��ɫ
Plugin 'vimchina/vim-fencview' "�Զ�ʶ���ļ�����
let g:fencview_autodetect=1
"------------------------------------------------------------------------------
Plugin 'vim-scripts/TxtBrowser'
"�������http://guoyoooping.blog.163.com/blog/static/1357051832009112910162389/

au BufEnter *.txt setlocal ft=txt
"------------------------------------------------------------------------------
Plugin 'vim-scripts/taglist.vim'
Plugin 'Tagbar'
" -----------------------------------------------------------------------------
"  < Tagbar ������� >
" -----------------------------------------------------------------------------
" ��� TagList �ܸ��õ�֧���������

" ����ģʽ������ tb ���ò��������д� TagList �������Ƚ���ر�
nmap tb :TlistClose<CR>:TagbarToggle<CR>

let g:tagbar_compact = 1 "�رն���������ʾ
autocmd VimEnter * nested :call tagbar#autoopen(1)
let g:tagbar_foldlevel = 2
let g:tagbar_sort = 0
let g:tagbar_width=30                       "���ô��ڿ��
"let g:tagbar_left=1                         "����ര������ʾ,Ĭ���Ҳ�

" -----------------------------------------------------------------------------
"  < TagList ������� >
" -----------------------------------------------------------------------------
" ��Ч�����Դ��, �书�ܾ���vc�е�workpace
" �������г��˵�ǰ�ļ��е����к�,ȫ�ֱ���, ��������

" ����ģʽ������ tl ���ò��������д� Tagbar �������Ƚ���ر�
nmap tl :TagbarClose<CR>:Tlist<CR>

let Tlist_Show_One_File=1                   "ֻ��ʾ��ǰ�ļ���tags
" let Tlist_Enable_Fold_Column=0              "ʹtaglist�������ʾ��ߵ��۵���
let Tlist_Exit_OnlyWindow=1                 "���Taglist���������һ���������˳�Vim
let Tlist_File_Fold_Auto_Close=1            "�Զ��۵�
let Tlist_WinWidth=30                       "���ô��ڿ��
let Tlist_Use_Right_Window=1                "���Ҳര������ʾ
"------------------------------------------------------------------------------
Plugin 'scrooloose/syntastic' "�﷨��������֧�ֶ�������
let g:syntastic_check_on_open = 1 "����Ϊÿ�δ�buffer��ִ���﷨��飬����ֻ���ڱ���ʱ

" -----------------------------------------------------------------------------
"  < indentLine ������� >
" -----------------------------------------------------------------------------
Plugin 'vim-scripts/indentLine.vim' "������
" ������ʾ�����ߣ��� indent_guides ����ʾ��ʽ�ϲ�ͬ�������Լ�ϲ��ѡ����
" ���ն��ϻ�����Ļˢ�µ����⣬��������ܽ���и�����
" ����/�رն�����
"nmap <leader>il :IndentLinesToggle<CR>

" ����Gvim�Ķ�������ʽ

 "  let g:indentLine_char = "��"
 "  let g:indentLine_first_char = "��"


" �����ն˶�������ɫ�������ϲ�����Խ���ע�͵�����Ĭ����ɫ
let g:indentLine_color_term = 239

" ���� GUI ��������ɫ�������ϲ�����Խ���ע�͵�����Ĭ����ɫ
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
"  < vimtweak �������� > ��ȷ������װ�˹���
" -----------------------------------------------------------------------------
" ����ֻ���ڴ���͸�����ö�
" ����ģʽ�� Ctrl + Up���Ϸ������ ���Ӳ�͸���ȣ�Ctrl + Down���·������ ���ٲ�͸���ȣ�<Leader>t �����ö�����л�
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

    "��ݼ�����
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
" ����ת�����崦�Ŀ�ݼ�ΪALT + G��������ܷǳ��� 
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR> 
" ��ȫ������ע����ͬ����Ч 
let g:ycm_complete_in_comments=1  
" �ӵ�һ�������ַ��Ϳ�ʼ����ƥ���� 
let g:ycm_min_num_of_chars_for_completion=2
"�뿪����ģʽ���Զ��ر�Ԥ������
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"�س���ѡ�е�ǰ��
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"�ض��崥����
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']


"==========================guifont++===============
"��vim��IDEһ��һ���Ŵ���С�ֺ�
let guifontpp_size_increment=1 "ÿ�θ��ĵ��ֺ�
let guifontpp_smaller_font_map="<M-Down>" 
let guifontpp_larger_font_map="<M-Up>" 
let guifontpp_original_font_map="<M-Home>"
