""""""""""""
" settings "
""""""""""""
" {{{ 1

set tabstop=4 shiftwidth=4 expandtab
set autoindent
set number
set textwidth=99 colorcolumn=+1
set cursorline
set ignorecase smartcase incsearch hlsearch
set gdefault
set nostartofline
set synmaxcol=300
set nocompatible
set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~
set iskeyword=@,48-57,_,192-255
set backspace=
set foldmethod=marker foldlevel=99 foldlevelstart=99
set laststatus=2 statusline=%m%t\ %{fugitive#statusline()}\ [%P]%=\ %{getcwd()}
set autoread
set whichwrap=""
set fillchars="vert:|,fold: "
set diffopt=filler,iwhite,vertical

let g:xml_syntax_folding = 1

" }}}


""""""""""""
" mappings "
""""""""""""
" {{{1

map / /\v
map ? ?\v

map <leader>/ :%s///gn <bar> :set hls<cr>
map <leader>do :diffget //
map <leader>dp :diffput //
map <leader>du :diffupdate<cr>
map <leader>{ :'{,'}
map <silent> <leader>' :checktime<cr>
map <silent> <leader>, :set buftype=nofile noreadonly modifiable <bar> :execute 'file ' . expand('%') . ' [Scratch]'<cr>
map <silent> <leader>C :CopyMatches<cr>
map <silent> <leader>b :execute (IsBufferDirty() ? ':BufExplorerVerticalSplit' : ':BufExplorer')<cr>
map <silent> <leader>h :nohlsearch<cr>
map <silent> <leader>j <leader><leader>j
map <silent> <leader>k <leader><leader>k
map <silent> <leader>n :execute 'NERDTreeToggle ' . (filereadable(expand('%')) ? expand('%') : '')<cr>
map <silent> <leader>p :diffput<cr>
map <silent> <leader>t :Tlist<cr>
map <silent> <leader>w <c-w>
map <silent> z- zb15<c-e>
map <silent> z<cr> zt15<c-y>
map Y y$

map <silent> <c-h> <c-w>h
map <silent> <c-j> <c-w>j
map <silent> <c-k> <c-w>k
map <silent> <c-l> <c-w>l

map <f2> :tabnew<cr>
map <f3> gT
map <f4> gt

noremap zl zL
noremap zL zl
noremap zh zH
noremap zH zh

" set commands
nmap <silent> <leader>sl :set list! list?<cr>
nmap <silent> <leader>sp :set paste! paste?<cr>
nmap <silent> <leader>sw :set wrap! wrap?<cr>
nmap <silent> <leader>ss :let &g:laststatus = 3 - &g:laststatus <bar> set laststatus?<cr>
nmap <silent> <leader>sd :set diff! <bar> let &scrollbind=&diff <bar> let &cursorbind=&diff <bar> set diff? scrollbind? cursorbind?<cr>
nmap <silent> <leader>sm :set modifiable! modifiable?<cr>
nmap <silent> <leader>sn :set number! number?<cr>
nmap <silent> <leader>se :set expandtab! expandtab?<cr>
nmap <silent> <leader>sy :execute exists('g:syntax_on') ? ':syntax off' : ':syntax on'<cr>

" format commands
nmap <silent> <leader>fc :%!c++filt<cr>
vmap <silent> <leader>fc :'<,'>!c++filt<cr>
nmap <silent> <leader>fh :ToggleHexdump<cr>

" }}}


""""""""""""
" AutoCmds "
""""""""""""
" {{{1

autocmd ColorScheme,BufEnter * silent! call HighLight('Tab',        '\t',    'DarkGray')
autocmd ColorScheme,BufEnter * silent! call HighLight('TrailingWS', '\s\+$', 'DarkGray')

autocmd FileType cpp setlocal foldmethod=syntax matchpairs+=<:> shiftwidth=4 tabstop=4 expandtab
autocmd FileType cpp setlocal commentstring=//%s

autocmd FileType c setlocal foldmethod=syntax shiftwidth=4 tabstop=4 expandtab
autocmd FileType c setlocal commentstring=//%s

autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType python setlocal commentstring=#%s

autocmd FileType xml setlocal foldmethod=syntax shiftwidth=4 tabstop=4

" }}}


""""""""""
" Vundle "
""""""""""
" {{{1

set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'brookhong/cscope.vim'
Plugin 'kevinw/pyflakes-vim'
Plugin 'mkitt/tabline.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-capslock'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi'

Plugin 'altercation/vim-colors-solarized'
    let g:solarized_termtrans=1
    syntax enable
    set background=dark
    colorscheme solarized

Plugin 'scrooloose/NERDTree'
    let g:NERDTreeWinSize = 50

Plugin 'taglist.vim'
    let g:Tlist_WinWidth = 50
    let g:Tlist_Show_One_File = 1
    let g:Tlist_Enable_Fold_Column = 0
    let g:Tlist_Sort_Type = 'name'

Plugin 'jlanzarotta/bufexplorer'
    let g:bufExplorerDisableDefaultKeyMapping = 1
    let g:bufExplorerFindActive = 0

Plugin 'kien/ctrlp.vim'
    let g:ctrlp_switch_buffer = 'et'

Plugin 'tpope/vim-fugitive'
    map <silent> <leader>ga :Git add %<cr>
    map <silent> <leader>gb :Gblame<cr>
    map <silent> <leader>gc :Gcommit<cr>
    map <silent> <leader>gd :Gdiff<cr>
    map <silent> <leader>gs :Gstatus<cr>
    map <silent> <leader>gw :Gwrite<cr>

Plugin 'Mark--Karkat'
    nmap <silent> <leader>mm <plug>Markset
    vmap <silent> <leader>mm <plug>Markset
    nmap <silent> <leader>mr <plug>MarkRegex
    vmap <silent> <leader>mr <plug>MarkRegex
    nmap <silent> <leader>mn <plug>MarkClear
    nmap <silent> <leader>mc :MarkClear<cr>
    nmap <silent> <leader>m* <plug>MarkSearchCurrentNext
    nmap <silent> <leader>m# <plug>MarkSearchCurrentPrev
    nmap <silent> <leader>m/ <plug>MarkSearchAnyNext
    nmap <silent> <leader>m? <plug>MarkSearchAnyPrev

Plugin 'mhinz/vim-grepper'
    map <silent> <leader>ag :Grepper -tool ag -noswitch<cr>
    map <silent> <leader>aw :Grepper -tool ag -noswitch -cword -noprompt<cr>
    map <silent> <leader>aa <plug>(GrepperOperator)

Plugin 'derekwyatt/vim-fswitch'
    nmap <silent> <leader>oo :FSHere<cr>
    nmap <silent> <leader>oh :FSLeft<cr>
    nmap <silent> <leader>oj :FSBelow<cr>
    nmap <silent> <leader>ok :FSAbove<cr>
    nmap <silent> <leader>ol :FSRight<cr>
    nmap <silent> <leader>oH :FSSplitLeft<cr>
    nmap <silent> <leader>oJ :FSSplitBelow<cr>
    nmap <silent> <leader>oK :FSSplitAbove<cr>
    nmap <silent> <leader>oL :FSSplitRight<cr>


filetype plugin indent on

" }}}


"""""""""""""
" functions "
"""""""""""""
" {{{1

function! HighLight(name, regex, color)
    execute 'highlight ' . a:name . ' ctermbg = ' . a:color

    if exists('g:highlight' . a:name)
        silent! call matchdelete(eval('g:highlight' . a:name))
    endif

    execute 'let g:highlight' . a:name . ' = matchadd(''' . a:name . ''', ''' . a:regex . ''')'
endfunction


function! IsBufferDirty()
    return !empty(expand('%')) || line('$') != 1 || getline('.') != ''
endfunction


function! CopyMatches(reg)
    let l:reg = empty(a:reg) ? '@' : a:reg
    let l:modifiable = &modifiable
    let &modifiable = 1
    let l:winview = winsaveview()
    execute 'let @' . l:reg . ' = ""'
    let hits = []
    silent %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/e
    execute 'let @' . l:reg . ' = join(hits, "\n") . "\n"'
    silent u
    call winrestview(l:winview)
    let &modifiable = l:modifiable
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)


function! CallWithQArgs(function, args)
python << endpython
import vim
import shlex
function = vim.eval('a:function')
args = vim.eval('a:args')
vim.command("call %s('%s')" % (function, "', '".join(shlex.split(args))))
endpython
endfunction


function! Toggle(set_cmd, unset_cmd, guard)
    let l:guard_name = 'b:toggleguard_' . a:guard
    if exists(l:guard_name) && eval(l:guard_name)
        execute 'unlet ' . l:guard_name
        execute a:unset_cmd
    else
        execute 'let ' . l:guard_name . ' = 1'
        execute a:set_cmd
    endif
endfunction
command! -nargs=* Toggle call CallWithQArgs('Toggle', <q-args>)


function! ToggleHexdump()
    let l:is_binary = empty(matchstr(getline(1), '^00000000: '))
    if l:is_binary
        execute ':%!xxd'
    else
        execute ':%!xxd -r'
    endif
endfunction
command! ToggleHexdump call ToggleHexdump()


" }}}


