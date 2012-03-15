set omnifunc=javascriptcomplete#CompleteJS

" code folding
function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=99
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
