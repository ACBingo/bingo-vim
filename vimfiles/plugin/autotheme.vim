"author Zhang

if &cp || exists('g:autotheme_disable')
let g:presenttime = localtime()%5000/100%11
func SetTheme(int)
if a:int == 0
    colorscheme zenburn
elseif a:int == 1
    colorscheme pyte
elseif a:int == 2
    colorscheme jellybeans
elseif a:int == 3
    colorscheme molokai
elseif a:int == 4
    set background=dark
    colorscheme solarized
elseif a:int == 5
    colorscheme gruvbox
elseif a:int == 6
    set background=light
    colorscheme solarized
elseif a:int == 7
    colorscheme codeschool
elseif a:int == 8
    colorscheme oceandeep
elseif a:int == 9
    colorscheme wombat256mod
else
    colorscheme wombat
endif
endfunc
endif

func Changetheme()
    let g:presenttime=(g:presenttime+1)%11
    execute "call SetTheme(g:presenttime)"
endfunc

execute "call SetTheme(g:presenttime)"

