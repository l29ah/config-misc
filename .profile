alias df='df -h'
alias cjknife="cjknife -d JISX0208"
alias gp='cd $(find .. -maxdepth 1 -type d | grep -C1 `basename $PWD` | head -n1)'
alias gn='cd $(find .. -maxdepth 1 -type d | grep -C1 `basename $PWD` | tail -n1)'
#export BROWSER=uzbl
#export CC=clang
#export CFLAGS=-std=c99
export WINEDLLOVERRIDES=mshtml=
export DARCS_DONT_ESCAPE_8BIT=1
