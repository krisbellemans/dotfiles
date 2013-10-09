" process only once
"if exists("my_vim_c_vim_loaded") || &compatible
"   finish
" endif

"let my_vim_c_vim_loaded = 1

" useful for arranging a block of comments
nmap <C-J> vip=
"autosave buffer when invoking make
set autowrite
" Setup tabstops to 8 and indents to 8
set tabstop=8
set shiftwidth=8
set noexpandtab

" line wrapping in c comments not c code
set textwidth=80        " Set the line wrap length
set cc=80
map <F9> :silent make -j3 thumb-debug\|redraw!\|:cw<CR>
map <F10> :silent make -j3 thumb-release\|redraw!\|:cw<CR>
map <F11> :silent make clean\|redraw!\|:cw<CR>

imap <F9> <ESC>:silent make -j3 thumb-debug\|redraw!\|:cw<CR>
imap <F10> <ESC>:silent make -j3 thumb-release\|redraw!\|:cw<CR>
imap <F11> <ESC>:silent make clean\|redraw!\|:cw<CR>

syn match ErrorLeadSpace /^ \+/      " highlight any leading spaces
syn match ErrorTailSpace / \+$/      " highlight any trailing spaces
match Error80            /\%>80v.\+/ " highlight anything past 80 in red

" more types...
syn keyword cType uint ubyte ulong uint64_t uint32_t uint16_t uint8_t boolean_t int64_t int32_t int16_t int8_t u_int64_t u_int32_t u_int16_t u_int8_t

syn keyword cOperator likely unlikely

" C-mode formatting options
"   t auto-wrap comment
"   c allows textwidth to work on comments
"   q allows use of gq* for auto formatting
"   l don't break long lines in insert mode
"   r insert '*' on <cr>
"   o insert '*' on newline with 'o'
"   n recognize numbered bullets in comments
set formatoptions=tcqlron


" C-mode options (cinoptions==cino)
" N	number of spaces
" Ns	number of spaces * shiftwidth
" >N	default indent
" eN	extra indent if the { is at the end of a line
" nN	extra indent if there is no {} block
" fN	indent of the { of a function block
" gN    indent of the C++ class scope declarations (public, private, protected)
" {N	indent of a { on a new line after an if,while,for...
" }N	indent of a } in reference to a {
" ^N	extra indent inside a function {}
" :N	indent of case labels
" =N	indent of case body
" lN	align case {} on the case line
" tN	indent of function return type
" +N	indent continued algibreic expressions
" cN	indent of comment line after /*
" )N	vim searches for closing )'s at most N lines away
" *N	vim searches for closing */ at most N lines away
set cinoptions=:0l1t0g0

"      " funky BK macros...
"      ":map <c-e> :!bk edit %<CR>:e!<CR>

" folding
"  - reserve 4 columns on the left for folding tree
"  - fold by syntax, use {}'s
"  - start with all folds open
if winwidth(0) > 80
    set foldcolumn=5
endif

set fdm=syntax
set foldnestmax=5
" syn region myFold start="{" end="}" transparent fold
" %foldopen!
set foldlevelstart=99
set foldlevel=99
" autocmd BufRead * normal zR
"  - bind meta< and meta> for fold colapse and extend
"map <m-,> :foldclose<CR>
"map <m-.> :foldopen<CR>

" cool C abbreviations...
abb #i #include
abb #d #define

" source ~/.vim/ccommenter.vim
" source ~/.vim/MakeDoxygenComment.vim

" source ~/.vim/localized_vimrc.vim

if has('gui_running')
    let winnum = bufwinnr("__Tag_List__")
    if winnum == -1
        "Tlist
    endif
endif

" 
" next block is from chapter 10 of the windows.txt vim help file 
" :h preview-window
"
":au! CursorHold *.[ch] nested call PreviewWord()

