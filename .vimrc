set clipboard=unnamedplus,autoselectplus
set modeline
set mouse=a
set incsearch
"set rnu
" set Haskell indent
"autocmd FileType haskell setlocal expandtab shiftwidth=8 softtabstop=8
autocmd FileType cabal setlocal expandtab
"au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger

set list listchars=tab:»·,trail:·

" disable shitty vim regex syntax
nnoremap / /\v
vnoremap / /\v

"set langmap="йцукенгшщзхъфывапролджэячсмитьбюёЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮЁ*№-/\":,._?%!;)+1234567890=\(qwertyuiop[]asdfghjkl;'zxcvbnm,./QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>?`1234567890-=\~!@#$%^&*()_+|A"
"set langmap=йцукенгшщзхъфывапролджэячсмитьбюёЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮЁ*№-/":,._?%!;)+1234567890=\(qwertyuiop[]asdfghjkl;'zxcvbnm,./QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>?`1234567890-=\~!@#$%^&*()_+|A
"set langmap=йцукенгшщзхъфывапролджэячсмитьбюёЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮЁqwertyuiop[]asdfghjkl\\;'zxcvbnm\\,./QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>?

let CoVim_default_name = "L29Ah"
let CoVim_default_port = "12334"

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
