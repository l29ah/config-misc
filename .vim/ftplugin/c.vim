source ~/.vim/ftplugin/develop.vim
setlocal cindent
setlocal shiftwidth=8
syntax region	cBlock		matchgroup=Operator start="{" end="}" contains=ALLBUT,cCurlyError,@cParenGroup,cErrInParen,cCppParen,cErrInBracket,cCppBracket,cCppString,@Spell fold
