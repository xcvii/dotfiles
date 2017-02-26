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
set foldlevel=99 foldlevelstart=99
"set laststatus=2 statusline=%m%t\ %{fugitive#statusline()}\ [%P]%=\ %{getcwd()}
set autoread
set whichwrap=""
"set foldtext=MyFoldText()
set fillchars="vert:|,fold: "
set diffopt=filler,iwhite,vertical


""""""""""""
" mappings "
""""""""""""

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
map <silent> <leader>c <Plug>NERDCommenterToggle
map <silent> <leader>h :nohlsearch<cr>
map <silent> <leader>j <leader><leader>j
map <silent> <leader>k <leader><leader>k
map <silent> <leader>n :execute 'NERDTreeToggle ' . (filereadable(expand('%')) ? expand('%') : '')<cr>
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

cnoremap <c-a> <home>
cnoremap <c-b> <left>
cnoremap <c-f> <right>
inoremap <c-a> <home>
inoremap <c-b> <left>
inoremap <c-f> <right>

nmap <silent> <leader>sl :set list! list?<cr>
nmap <silent> <leader>sp :set paste! paste?<cr>
nmap <silent> <leader>sw :set wrap! wrap?<cr>
nmap <silent> <leader>ss :let &g:laststatus = 3 - &g:laststatus <bar> set laststatus?<cr>
nmap <silent> <leader>sd :set diff! <bar> let &scrollbind=&diff <bar> let &cursorbind=&diff <bar> set diff? scrollbind? cursorbind?<cr>
nmap <silent> <leader>sm :set modifiable! modifiable?<cr>
nmap <silent> <leader>sn :set number! number?<cr>
nmap <silent> <leader>se :set expandtab! expandtab?<cr>
nmap <silent> <leader>sy :execute exists('g:syntax_on') ? ':syntax off' : ':syntax on'<cr>


""""""""""
" Vundle "
""""""""""

set runtimepath+=~/.vim/bundle/vundle
call vundle#rc()

    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'Mark--Karkat'
    Plugin 'brookhong/cscope.vim'
    Plugin 'derekwyatt/vim-fswitch'
    Plugin 'gmarik/vundle'
    Plugin 'kevinw/pyflakes-vim'
    Plugin 'mhinz/vim-grepper'
    Plugin 'mkitt/tabline.vim'
    Plugin 'octol/vim-cpp-enhanced-highlight'
    Plugin 'tomtom/tlib_vim'
    Plugin 'tpope/vim-repeat'



    """""""""""""""""
    """ solarized """
    """""""""""""""""
    Plugin 'altercation/vim-colors-solarized'

    let g:solarized_termtrans=1
    syntax enable
    set background=dark
    colorscheme solarized


    """"""""""""""""
    """ NERDTree """
    """"""""""""""""
    Plugin 'scrooloose/NERDTree'

    let g:NERDTreeWinSize = 50


    """""""""""""""
    """ Taglist """
    """""""""""""""
    Plugin 'taglist.vim'

    let g:Tlist_WinWidth = 50
    let g:Tlist_Show_One_File = 1
    let g:Tlist_Enable_Fold_Column = 0
    let g:Tlist_Sort_Type = 'name'


    """""""""""""""""""""
    """ NERDCommenter """
    """""""""""""""""""""
    Plugin 'scrooloose/NERDCommenter'

    let g:NERDCreateDefaultMappings = 0


    """""""""""""""""""
    """ BufExplorer """
    """""""""""""""""""
    Plugin 'jlanzarotta/bufexplorer'

    let g:bufExplorerDisableDefaultKeyMapping = 1
    let g:bufExplorerFindActive = 0


    """""""""""""
    """ ctrlp """
    """""""""""""
    Plugin 'kien/ctrlp.vim'

    let g:ctrlp_switch_buffer = 'et'


    """"""""""""""""
    """ Fugitive """
    """"""""""""""""
    Plugin 'tpope/vim-fugitive'

    map <silent> <leader>ga :Git add %<cr>
    map <silent> <leader>gb :Gblame<cr>
    map <silent> <leader>gc :Gcommit<cr>
    map <silent> <leader>gd :Gdiff<cr>
    map <silent> <leader>gs :Gstatus<cr>
    map <silent> <leader>gw :Gwrite<cr>




filetype plugin indent on


""""""""""""""""
" highlighting "
""""""""""""""""

autocmd ColorScheme,BufEnter * call HighLight('Tab',        '\t',    'DarkGray')
autocmd ColorScheme,BufEnter * call HighLight('TrailingWS', '\s\+$', 'DarkGray')


"""""""""""""
" functions "
"""""""""""""

function! HighLight(name, regex, color)
    execute 'highlight ' . a:name . ' ctermbg = ' . a:color

    if exists('g:highlight' . a:name)
        silent! call matchdelete(eval('g:highlight' . a:name))
    endif

    execute 'let g:highlight' . a:name . ' = matchadd(''' . a:name . ''', ''' . a:regex . ''')'
endfunction


function! IsBufferDirty()
    return !empty(expand('%')) || line('$') != 1 || getline != ''
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


