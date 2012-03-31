" omnicomplete for js, less useful compared to
" the thousands of functions-type situation in PHP
" sadly, it doesn't recognize that 'foo = {}' means
" 'foo = new Object()'. TODO: improve someday.
omnifunc=javascriptcomplete#CompleteJS


" fold on curly braces. Kinda annoying that every single
" conditional is also folded, but them's the breaks.
function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
call JavaScriptFold()
setl fen
