" simplified vim settings, last updated 7 Feb 2022

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent

syntax on

set backspace=indent,eol,start

filetype plugin indent on

autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=8 noexpandtab

set ruler

set foldenable
set foldmethod=indent

" syntax highlight firefox .jsm files
au BufReadPost *.jsm set syntax=javascript
