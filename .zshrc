# Lines configured by zsh-newuser-install
setopt appendhistory extendedglob notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/l29ah/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#zstyle ':completion:*' expand 'yes'
#zstyle ':completion:*' squeeze-shlashes 'no'
#zstyle ':completion::complete:*' '\\'

#exec 2>>(while read line; do
#  print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0'; done &)

. ~/.profile

export PERL_LOCAL_LIB_ROOT="/home/l29ah/perl5";
export PERL_MB_OPT="--install_base /home/l29ah/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/l29ah/perl5";
export PERL5LIB="/home/l29ah/perl5/lib/perl5/x86_64-linux-thread-multi:/home/l29ah/perl5/lib/perl5";
export PATH="/home/l29ah/perl5/bin:$PATH";

# Disable fucking unuzbl autocompletion
unsetopt AUTO_MENU

# Vi mode indicator
zle-keymap-select () {
if [ $KEYMAP = vicmd ]; then
echo -ne "\033]12;Red\007"
else
echo -ne "\033]12;Grey\007"
fi
}
zle -N zle-keymap-select
zle-line-init () {
zle -K viins
echo -ne "\033]12;Grey\007"
}
zle -N zle-line-init
bindkey -v

if [[ ${EUID} == 0 ]] ; then
	PS1="%B%F{red}${zshhostPS1:-%m} %B%F{blue}%~ ∞%b%f %F{white}"
else
	PS1="%B%F{magenta}%n%F{white}Z%F{magenta}${zshhostPS1:-%m} %B%F{blue}%~ ‰%b%f %F{white}"
fi

alias grep='grep --colour=auto'
alias ls='ls --color=auto'

setopt histignoredups incappendhistory hist_ignore_space

case "$TERM" in
        xterm)
                bindkey "^[OH" beginning-of-line
                bindkey "^[OF" end-of-line
                bindkey "^[[H" beginning-of-line
                bindkey "^[[F" end-of-line
                ;;
        rxvt-unicode)
                bindkey "^[[7~" beginning-of-line
                bindkey "^[[8~" end-of-line
                ;;
        *)
                bindkey "^[[1~" beginning-of-line
                bindkey "^[[4~" end-of-line
esac
bindkey "^[[3~" delete-char
bindkey "^[[2~" yank
bindkey "^[[5~" up-line-or-history
bindkey "^[[6~" down-line-or-history

bindkey "^R" history-incremental-pattern-search-backward

# YEAH
setopt NO_BEEP

export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE=~/.zhistory
setopt inc_append_history
setopt extendedhistory

# fix Home and End keys
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
