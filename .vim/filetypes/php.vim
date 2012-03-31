"trying autocomplete for php
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" autocomplete is better with the 'scratch' window at the top
" ...it shows you the params of a function
set completeopt+=menuone

" fold php automatically - giving it another shot, this time with
" the phpfolding.vim plugin
let php_folding=0
setlocal foldmethod=manual
EnableFastPHPFolds

" highlight php vars in sql queries,
" and highlight the sql syntax
autocmd FileType php let php_sql_query=1

" on windows this would be cabbr php !c:\xampp\php\php.exe %
cabbr PHP !php %

" let's add the linter, eh?
cabbr PHPL !php -l %


" settings for phpDocumentor script
" TODO: update or remove. Don't really use docblocks, except for 
" annotation-style metareflective programming :-\

" added 4/14/08
" just following instructions from the script's page at vim.org

" created $HOME/.vim directory, moved php-doc.vim into it:
source ~/.vim/php-doc.vim

" we map ctrl + p to the doc functions:
"        inoremap <C-p> <ESC>:call PhpDocSingle()<CR>i
"       nnoremap <C-p> :call PhpDocSingle()<CR>
"      vnoremap <C-p> :call PhpDocRange()<CR>


" settings for PHP ctags
" TODO: update or remove. the ctags-generator is pretty ugly, and
" settings tags in this way is pretty useless.

" assuming we've run ctags-generator.sh, enable the
" jump-to-definition and jump-back, which are Ctrl-[ and Ctrl-T:

" tags file of the moment:
set tags=~/.vim/mytags/zendFramework1.7.0


" PHP manual lookup via lynx
" quick instructions: put cursor over any php function or keyword.
" then, hit ctrl-p. then, lynx will fetch awesome text into a scratch
" window at the top of your screen. if lynx isn't installed, just
" insert the call to elinks or whatever text-based browser you've got.

" this splits the screen and fetches stuff using lynx.
" you can also use whatever other text-based browser.
fun! OpenPhpFunction (keyword)
    let proc_keyword = substitute(a:keyword , '_', '-', 'g')

    " create new preview split or switch to existing.
    "   vim has a Preview split which is a singleton,
    "   one per tab. This is perfect for repeated
    "   uses of the manual feature.

    " for some reason, I was getting errors
    " when trying to open a preview window. 
    " but I'm unable to reproduce. Who knows...

    " try opening a new preview window.
    try
      exe 'pedit'
      " sometimes seems to throw an error
    catch /.*/
    endtry
    " switch to the preview
    exe 'wincmd P'
    " edit a new buffer
    exe 'enew'
    
    " don't associate any file or swap file
    " with this buffer. http://vim.wikia.com/wiki/VimTip135
    " the first command automatically names
    " the buffer [Scratch]. We could use this
    " to reuse the scratch window.
    exe "set buftype=nofile"
    exe "setlocal noswapfile"

    "call browser and fetch the file. we use lynx here.
    "php actually has a great script that fetches
    "info on lots of things other than functions.
    "so let it do its thing.
    exe 'silent r!lynx -dump -nolist http://php.net/'.proc_keyword

" this should not be called if the response isn't a function.
" need to look into vimscript conditionals.
    " now we format the results:
    " enter normal mode and go to top of manual entry
    exe 'norm gg'
    " 1. this was given by original author
    "    at http://vim.wikia.com/wiki/PHP_online_help
    "    Problem: doesn't search far enough down the page
    "    exe 'call search ("' . a:keyword .'")'

    " 2. I came up with this to remove stuff at top of 
    "    file for function retrievals.
    "    Idea: search down to Description. Then go up 8 lines.
    "    Problem: doesn't work for non-function man pages.
    "    exe 'call search("Description")'
    "    exe 'norm 8kdgg'

    " 3. Best idea so far: search down to a really long underscore.
    "    This will be the search box if your underscore is short.
    "    If it's long enough, you'll match on the horizontal line
    "    that is above the definition we really want.
    exe 'call search("____________________________________")'
    exe 'norm dgg'

    " delete the user notes at the bottom. it's a lot of text,
    " and they are almost completely useless.
    " TODO: but they sometimes mention known horrible bugs?
    exe 'call search("User Contributed Notes")'
    exe 'norm dGgg'
endfun

" manual lookup is mapped to ctrl-p
" ctrl-o is used to jump out of insert mode for one command.
" - jump out for one command <C-O>
" - call OpenPhpFunction with the word under cursor
" - CR seems to indicate end of fcn call
" - <C-O> again - we are in insert mode in the man page
" - this time, we jump back to previous window.
" - at the end of the day, we are still in insert mode,
"   the cursor is in exactly the same spot, and the man
"   page for php is visible
inoremap <C-p> <C-O>:call OpenPhpFunction('<c-r><c-w>')<CR><C-O>:wincmd p<CR>
nnoremap <C-p> :call OpenPhpFunction('<c-r><c-w>')<CR>:wincmd p<CR>
vnoremap <C-p> :call OpenPhpFunction('<c-r><c-w>')<CR>:wincmd p<CR>

