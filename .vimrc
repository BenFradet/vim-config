set nocompatible

"pathogen
call pathogen#infect()
"
"autocmd vimenter * NERDTree

set title

set number
set ruler
set wrap

set scrolloff=3

set ignorecase
set smartcase

set incsearch
set hlsearch

set visualbell
set noerrorbells

set backspace=indent,eol,start

set hidden

if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

syntax enable

filetype on
filetype plugin on
filetype indent on

"solarized
set background=dark
colorscheme solarized
"

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

imap ;; <Esc>
map ;; <Esc>

set tabstop=4
set shiftwidth=4
set expandtab

let mapleader = "\\"

"ack
let g:ackprg="ack -H --nocolor --nogroup --column"
nmap <leader>j mA:Ack<space>
nmap <leader>ja mA:Ack "<C-r>=expand("<cword>")<cr>"
nmap <leader>jA mA:Ack "<C-r>=expand("<cWord>")<cr>"
"

let g:ctrl_map = '<c-p>'

"neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length=4
let g:neocomplcache_lock_buffer_name_pattern='\*ku\*'

let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <expr><C-g>    neocomplcache#undo_completion()
inoremap <expr><C-l>    neocomplcache#complete_common_string()
inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h>    neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS>     neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>    neocomplcache#close_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"

let g:syntastic_c_checkers=['make']
