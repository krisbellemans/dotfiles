set nocompatible
filetype on
set path=$PWD/**
set shiftwidth=4
set softtabstop=4
set spell
if has('autocmd')
    filetype plugin indent on

    autocmd BufEnter *.c,*.h,*.cpp,*.hpp,*.cc source ~/.vim/c.vim
endif
syntax enable

" map a urxvt cube number to an xterm-256 cube number
fun! <SID>M(a)
    return strpart("0135", a:a, 1) + 0
endfun

" map a urxvt colour to an xterm-256 colour
fun! <SID>X(a)
    if &t_Co == 88
        return a:a
    else
        if a:a == 8
            return 237
        elseif a:a < 16
            return a:a
        elseif a:a > 79
            return 232 + (3 * (a:a - 80))
        else
            let l:b = a:a - 16
            let l:x = l:b % 4
            let l:y = (l:b / 4) % 4
            let l:z = (l:b / 16)
            return 16 + <SID>M(l:x) + (6 * <SID>M(l:y)) + (36 * <SID>M(l:z))
        endif
    endif
endfun

if has('gui_running')
    set background=dark
    colorscheme solarized
    hi Error80        gui=NONE   guifg=#ffffff   guibg=#6e2e2e
    hi ErrorLeadSpace gui=NONE   guifg=#ffffff   guibg=#6e2e2e
    hi ErrorTailSpace gui=NONE   guifg=#ffffff   guibg=#6e2e2e
else
    set background=dark
    colorscheme solarized
    set mouse=a
    exec "hi Error80        cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(32)
    exec "hi ErrorLeadSpace cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(33)
    exec "hi ErrorTailSpace cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(33)
endif
set nu
set cul
set printoptions=number:y
set ls=2
set hlsearch
map <C-0> :!ctags -R --c-kinds=+pxfd --fields=+iaS --extra=+q .<CR>
map + zfa}
" au BufWinLeave *.* mkview
" au BufWinEnter *.* silent loadview
set nocp
filetype plugin on
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowPrototypeInAbbr = 1
set guifont=Inconsolata\ 12
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=l
set guioptions=
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
imap jj <ESC>
set nobackup
set nowritebackup
"if &term =~ "xterm\\|rxvt"
     " use an orange cursor in insert mode
   " let &t_SI = "\<Esc>]12;orange\x7"
    " use a red cursor otherwise
   " let &t_EI = "\<Esc>]12;red\x7"
   " silent !echo -ne "\033]12;red\007"
    " reset cursor when vim exits
   " autocmd VimLeave * silent !echo -ne "\033]112\007"
    " use \003]12;gray\007 for gnome-terminal
"endif
"if &term =~ '^xterm'
      " solid underscore
    " solid block
    " 1 or 0 -> blinking block
    " 3 -> blinking underscore
"endif
"if &term =~ "xterm\\|rxvt"
        " use an orange cursor in insert mode
"let &t_SI = "\<Esc>]12;orange\x7"
let &t_SI = "\e]12;orange\x7"
"let &t_SI .= "\<Esc>[3 q"
let &t_SI .= "\e[3 q"
	"         " use a red cursor otherwise

"let &t_EI = "\<Esc>]12;red\x7"
let &t_EI = "\e]12;red\x7"
"let &t_EI .= "\<Esc>[1 q"
let &t_EI .= "\e[1 q"
silent !echo -e "\033]12;red\007"
	"                     " reset cursor when vim exits
autocmd VimLeave * silent !echo -e "\033]112\007"
	"                             " use \003]12;gray\007 for
	"                             gnome-terminal
"endif 

