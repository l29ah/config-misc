#!/bin/bash
set -x
. /etc/profile
. ~/.profile
keyboard-setup
[[ -e ~/.xsession.local ]] && . ~/.xsession.local
#setxkbmap -option 'compose:menu'
#xset m 2 0	# 800dpi
xset m 1 0	# 2000dpi
xset dpms 0 0 600

# uim kludges
#export GTK_IM_MODULE=uim
#export QT_IM_MODULE=uim
#uim-xim &
#export XMODIFIERS=@im=uim
# Make gtk+ respect ~/.XCompose
GTK_IM_MODULE=xim

gpg-agent --daemon > ~/.gpg-agent-info
. ~/.gpg-agent-info

# Compton goodness; doesn't work with xsetroot
hsetroot -solid "#000000"
export DBUS_SESSION_BUS_ADDRESS=$(/usr/bin/dbus-launch --autolaunch `cat /var/lib/dbus/machine-id` --binary-syntax --close-stderr)
# ALSAAudioInput: Ошибка потоков канала
`ls -1 ~/.xmonad/xmonad-x* | sed q` &> /dev/null &
compton -b --backend glx --vsync opengl --dbus
unset DBUS_SESSION_BUS_ADDRESS

xset s 600
xss-lock -q lock &

#twmnd &
dunst &
#LANG=ru_RU.UTF-8 conky -q -d
urxvt -title dzencontent -e dzencontent &
urxvt -title pinger -e pinger &
urxvt -title atop -e sudo btop &
urxvt -title syslog -e sudo tail -Fn 400 /var/log/everything/current &
#unclutter -idle 3 -jitter 1 &

# other shit
#bitcoin &
evilvte &

#for c in 'su -' ncmpc; do
#	evilvte -T $c -e $c &
#done

#uzblcookied
#uzbl-event-manager -va start
#sleep 7 # TODO wait for the internets
pgrep wish >/dev/null || {
	tkabber &
	#psi-plus &
	echo $DISPLAY > ~/.config/display
}
sleep 2

if [[ ! -d ~/mnt/xmpp/roster ]]; then
	hatexmpp-mount &
fi
xbindkeys
[[ -v xs_touchpad ]] && synclient MaxSpeed=5 CircularScrolling=0 VertEdgeScroll=0 VertTwoFingerScroll=1 EmulateTwoFingerMinW=8 EmulateTwoFingerMinZ=1 && xinput set-int-prop 11 303 8 1 && xinput set-int-prop 11 307 8 2
[[ -v xs_trackpoint ]] && synclient VertTwoFingerScroll=1 HorizTwoFingerScroll=1 EmulateTwoFingerMinW=0 EmulateTwoFingerMinZ=1
#transmission-gtk &
# Allow for root connections
xhost +SI:localuser:root
arbtt-capture -r 5
sleep 1000d
