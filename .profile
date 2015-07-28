export BROWSER=firefox
export DARCS_DONT_ESCAPE_8BIT=1
export EDITOR=vim
export PATH=~/"bin/:$PATH"
export QT_QPA_PLATFORMTHEME=qt5ct
. ~/.gpg-agent-info
export GPG_AGENT_INFO
export SSH_AUTH_SOCK
export SSH_AGENT_PID
alias gr='grep -R'
. ~/.profile.local
# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
   # Shell is non-interactive.  Be done now
   return
fi
fortune -a
