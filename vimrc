execute pathogen#infect()

" Settings {{{

syntax on
filetype plugin indent on

set backspace=indent,eol,start
set nocompatible
set nocursorline
set dir=~/.vim/swp
set expandtab
set foldmethod=syntax
set foldlevel=1
set foldnestmax=1
set laststatus=2
set hidden
set history=9999
set nohlsearch
set incsearch
set ignorecase
if has('mouse')
    set mouse=a
endif
set number
set tw=72
set tabstop=4 shiftwidth=4 expandtab
set scrolloff=3 sidescrolloff=9 sidescroll=1
set shortmess+=I
set showcmd
set smartcase
set smarttab smartindent
set splitright
set undofile undodir=~/.vim/undo
set nowrap linebreak
set wildmenu
set wildignore+=*/node_modules/*,*/dist/*

highlight MatchParen ctermbg=darkgreen
highlight Search ctermbg=gray

" }}}
" Mappings {{{

let mapleader=","

" Jump only to marks in local buffer by default
nnoremap ' `
nnoremap ` '

" Shortcut for global search replace
nnoremap S :%s/

" Make Y act like other capitals
noremap Y y$

" Sudo write
cnoremap !w w !sudo tee %

" Jump between functions
nmap [[ ?{<CR>w99[{
nmap ][ /}<CR>b99]}
nmap ]] j0[[%/{<CR>
nmap [] k$][%?}<CR>

" Plugin mappings
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>es :UltiSnipsEdit<CR>
nnoremap <leader>ef :tabedit ~/.vim/ftplugin<CR>
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader>s :SyntasticCheck<CR>
nnoremap <leader>sc :SyntasticCheck<CR>
nnoremap <leader>sr :SyntasticReset<CR>
nnoremap <leader>t :Tabularize<Space>
vnoremap <leader>t :Tabularize<Space>
nnoremap <leader>b :TagbarToggle<CR>

" Go Mappings
nnoremap <leader>gi :GoImports<CR>
nnoremap <leader>gb :GoBuild<CR>
nnoremap <leader>gl :GoLint<CR>
nnoremap <leader>gr :GoRun<CR>
nnoremap <leader>gt :GoTest<CR>
nnoremap <leader>gd :GoDoc<Space>

nnoremap <leader>w :write<CR>
nnoremap <leader>q :wq<CR>
nnoremap <leader>v :vsplit<space>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nnoremap <silent> <leader>; :call <SID>ChangeEnd(';')<CR>
nnoremap <silent> <leader>, :call <SID>ChangeEnd(',')<CR>
nnoremap <silent> <leader>. :call <SID>ChangeEnd('.')<CR>
nnoremap <silent> <leader><space> :call <SID>ChangeEnd('')<CR>

" }}}
" Functions {{{

fun! <SID>StripTrailingWhitespace()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
endfun

fun! <SID>ChangeEnd(char)
    call setline(line('.'), substitute(getline('.'), '[;,.]\?\s*$', a:char, ''))
endfun

" }}}
" AutoCommands {{{

" Powerline Fast Escape
if !has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

augroup EditVIMRC
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd BufWritePost setlocal fdm=marker
    autocmd BufWritePost setlocal foldlevel=0
augroup END

augroup TrailingSpaces
    autocmd!
    autocmd BufWritePre * :call s:StripTrailingWhitespace()
augroup END

augroup JSFold
    autocmd!
    autocmd FileType javascript call JavaScriptFold()
augroup END

augroup Emmet
    autocmd!
    autocmd FileType css,html imap <expr> <C-@> emmet#expandAbbrIntelligent("\<c-@>")
    autocmd FileType html let b:emmet_quote_char="'"
augroup END
" }}}
" Plugin Settings {{{

" let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutFastWrap = '<c-z>'

let g:NERDSpaceDelims = 1

let g:SuperTabDefaultCompletionType = 'context'

let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_c_check_header = 1
let g:syntastic_c_config_file = '~/.vim/syntastic_avrgcc.config'
" }}}

" vim:fdm=marker foldlevel=0
