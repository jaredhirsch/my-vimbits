" expandtab causes makefiles to break, because makefiles need real tabstops.
" to fix this, trying the following suggestion from vim.org:
autocmd FileType make setlocal noexpandtab
