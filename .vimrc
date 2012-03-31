" stuff that applies to every filetype/general text file editing:

" nocompatible needed for a lot of vim behavior to 'just work'
set nocompatible

" some debian distros disable modelines by default for security reasons
set modeline modelines=5 

" fold markers are awesome, but ugly. I switched to indent-folding.
set foldmethod=indent

" python now uses 4 spaces, and php and js do, too. so, do that here.
set expandtab
set shiftwidth=4
set tabstop=4

" adding this one to make backspacing more friendly
set softtabstop=4

" autoindent will preserve tab depth after a carriage return.
" indispensable when writing code.
set autoindent

" enable syntax highlighting
syntax on

" visual bell: flash screen instead of beeping
set visualbell

" where available, mousewheel scrolling is a revelation.
" also enables click-drag resizing of windows and highlighting
" text in vi's visual mode. super cool.
set mouse=a

" put the ruler at bottom right, so we can keep track of our column number
set ruler

" disable backup files (foo.txt~ and so on)
set nobackup
set nowritebackup

" Color settings: love the old school green-on-black
hi normal ctermfg=green ctermbg=black guifg=white guibg=black
hi nontext ctermfg=brown ctermbg=black guifg=brown guibg=blue

" subfiles for different languages, to hide plugin clutter
autocmd FileType php source ~/.vim/filetypes/php.vim
autocmd FileType javascript source ~/.vim/filetypes/js.vim
autocmd FileType py source ~/.vim/filetypes/py.vim

" expandtab causes makefiles to break, because makefiles need real tabstops.
" to fix this, trying the following suggestion from vim.org:
autocmd FileType make setlocal noexpandtab
