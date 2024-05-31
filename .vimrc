" simplified vim settings, last updated 29 May 2024

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

" syntax highlight IDL files, too
au BufReadPost *.idl set syntax=javascript
