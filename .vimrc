if has('nvim')
	set clipboard+=unnamedplus
else
	set clipboard=unnamedplus,autoselectplus
endif
set modeline
set mouse=a
set incsearch

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

execute pathogen#infect()

"set rnu
" set Haskell indentfiletype off                  " required


"autocmd FileType haskell setlocal expandtab shiftwidth=8 softtabstop=8
autocmd FileType cabal setlocal expandtab
autocmd FileType text setlocal foldmethod=indent
"au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger

set list listchars=tab:»\ ,trail:·

" disable shitty vim regex syntax
nnoremap / /\v
vnoremap / /\v

"set langmap="йцукенгшщзхъфывапролджэячсмитьбюёЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮЁ*№-/\":,._?%!;)+1234567890=\(qwertyuiop[]asdfghjkl;'zxcvbnm,./QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>?`1234567890-=\~!@#$%^&*()_+|A"
"set langmap=йцукенгшщзхъфывапролджэячсмитьбюёЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮЁ*№-/":,._?%!;)+1234567890=\(qwertyuiop[]asdfghjkl;'zxcvbnm,./QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>?`1234567890-=\~!@#$%^&*()_+|A
"set langmap=йцукенгшщзхъфывапролджэячсмитьбюёЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮЁqwertyuiop[]asdfghjkl\\;'zxcvbnm\\,./QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>?

let CoVim_default_name = "L29Ah"
let CoVim_default_port = "12334"

au VimEnter * RainbowParenthesesToggle
au VimEnter * RainbowParenthesesLoadRound
au VimEnter * RainbowParenthesesLoadSquare
au VimEnter * RainbowParenthesesLoadBraces

autocmd StdinReadPre * let s:std_in=1
if !has('nvim')
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
endif

let g:XkbSwitchEnabled = 1
