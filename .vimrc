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
" don't break lines automatically; see /usr/share/vim/*/ftplugin/mail.vim
autocmd FileType mail setlocal textwidth=0
autocmd FileType text setlocal textwidth=0

" Ledger ft
"au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger
autocmd FileType ledger let b:SuperTabDisabled = 1
autocmd FileType ledger setlocal ignorecase smartcase

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
let g:rbpt_colorpairs = [
	\ ['brown',       'RoyalBlue3'],
	\ ['darkcyan',    'RoyalBlue3'],
	\ ['darkgray',    'DarkOrchid3'],
	\ ['green',       'yellow1'],
	\ ['darkred',     'SeaGreen3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['brown',       'firebrick3'],
	\ ['gray',        'RoyalBlue3'],
	\ ['darkmagenta', 'DarkOrchid3'],
	\ ['green',       'yellow1'],
	\ ['darkcyan',    'SeaGreen3'],
	\ ['red',         'firebrick3'],
	\ ]

autocmd StdinReadPre * let s:std_in=1
if !has('nvim')
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
endif

let g:XkbSwitchEnabled = 1

" for hex editing
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

" gitgutter bullshit
set updatetime=100
