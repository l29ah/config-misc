source ~/.vim/ftplugin/develop.vim

" Eclim bindings
map <F2> :JavaCorrect<CR>
map <F3> :JavaSearchContext<CR>

" Folding
"set foldmethod=marker
"set foldmarker={,}

"function! Num2S(num, len)
"    let filler = "                                                            "
"    let text = '' . a:num
"    return strpart(filler, 1, a:len - strlen(text)) . text
"endfunction

"function! FoldText()
"    let sub = substitute(getline(v:foldstart), '/\*\|\*/\|{{{\d\=', '', 'g')
"    let diff = v:foldend - v:foldstart + 1
"    return  '+' . v:folddashes . '[' . Num2S(diff,3) . ']' . sub
"endfunction
"
"set foldtext=FoldText()

