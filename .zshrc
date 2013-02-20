# Lines configured by zsh-newuser-install
setopt appendhistory extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/l29ah/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#zstyle ':completion:*' expand 'yes'
#zstyle ':completion:*' squeeze-shlashes 'no'
#zstyle ':completion::complete:*' '\\'

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zhistory
setopt inc_append_history

#exec 2>>(while read line; do
#  print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0'; done &)

. ~/.profile

export PERL_LOCAL_LIB_ROOT="/home/l29ah/perl5";
export PERL_MB_OPT="--install_base /home/l29ah/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/l29ah/perl5";
export PERL5LIB="/home/l29ah/perl5/lib/perl5/x86_64-linux-thread-multi:/home/l29ah/perl5/lib/perl5";
export PATH="/home/l29ah/perl5/bin:$PATH";
