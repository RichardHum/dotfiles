set dir=/tmp
set viminfo=
map <C-j> :prev<CR>
map <C-k> :next<CR>
"map <tab> <esc>
"map! <tab> <esc>
"set cindent
set autoindent
filetype plugin on
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
syntax on
set nohlsearch
"set foldmethod=indent
set ls=2
set ruler
set backspace=2

nmap \o :set paste!<CR>
nmap \l :setlocal number!<CR>

nnoremap <F5> "=strftime("%H:%M")<CR>P
inoremap <F5> <C-R>=strftime("%H:%M")<CR>

" For local replace
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>

" For global replace
nnoremap gR gD:%s/<C-R>///gc<left><left><left>
