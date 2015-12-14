set nocompatible
filetype on
set path=$PWD/**,/usr/include/**,/usr/local/include/**
set shiftwidth=4
set softtabstop=4
set spell
if has('autocmd')
    filetype plugin indent on

    autocmd BufEnter *.c,*.h,*.cpp,*.hpp,*.cc source ~/.vim/c.vim
    autocmd BufEnter *.py,*.py3 source ~/.vim/python.vim
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
    " let g:solarized_italic=0
    " let g:solarized_bold=0
    set background=light
    colorscheme solarized
    " hi Error80        gui=NONE   guifg=#ffffff   guibg=#93a1a1
    hi Error132        gui=NONE   guifg=#ffffff   guibg=#93a1a1
    " hi ErrorLeadSpace gui=NONE   guifg=#ffffff   guibg=#6e2e2e
    hi ErrorLeadSpace gui=NONE   guifg=#ffffff   guibg=#93a1a1
    " hi ErrorTailSpace gui=NONE   guifg=#ffffff   guibg=#6e2e2e
    hi ErrorTailSpace gui=NONE   guifg=#ffffff   guibg=#93a1a1
else
    set background=light
    colorscheme solarized
    set mouse=a
    " exec "hi Error80        cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(32)
    exec "hi Error132        cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(32)
    exec "hi ErrorLeadSpace cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(33)
    exec "hi ErrorTailSpace cterm=NONE   ctermfg=" . <SID>X(79) . " ctermbg=" . <SID>X(33)
endif
set nu
set cul
set cursorcolumn
" set printoptions=number:y
set ls=2
set hlsearch
set showmatch
map <C-0> :!ctags -R --c-kinds=+pxfd --fields=+iaS --extra=+q .<CR>
map + zfa}
" au BufWinLeave *.* mkview
" au BufWinEnter *.* silent loadview
map ; :
map <C-j> :bp<CR>
map <C-k> :bn<CR>
"noremap ;; ;
noremap <C-;> ;
"map : ;
map <Space> <c-d>
set nocp
filetype plugin on
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:bufferline_echo = 0
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#whitespace#enabled = 0
set noshowmode
set completeopt-=preview
"set guifont=Inconsolata\ 12
set guifont=Inconsolata\ for\ Powerline\ 12
"set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
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
set wildchar=<Tab> wildmenu wildmode=full

runtime ftplugin/man.vim
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
"let &t_SI = "\e]12;orange\x7"
"let &t_SI .= "\<Esc>[3 q"
"let &t_SI .= "\e[3 q"
	"         " use a red cursor otherwise

"let &t_EI = "\<Esc>]12;red\x7"
"let &t_EI = "\e]12;red\x7"
"let &t_EI .= "\<Esc>[1 q"
"let &t_EI .= "\e[1 q"
"silent !echo -e "\033]12;red\007"
	"                     " reset cursor when vim exits
autocmd VimLeave * silent !echo -e "\033]112\007"
	"                             " use \003]12;gray\007 for
	"                             gnome-terminal
"endif 


