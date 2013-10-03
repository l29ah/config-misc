#!/bin/bash
. /etc/profile
#setxkbmap -option 'compose:menu'
#xset m 2 0	# 800dpi
xset m 1 0	# 2000dpi
xset r rate 225 50 # vim-friendly fast repeat
#xsetroot -solid black

# uim kludges
#export GTK_IM_MODULE=uim
#export QT_IM_MODULE=uim
#uim-xim &
#export XMODIFIERS=@im=uim
#export BROWSER=uzbl
export BROWSER=firefox

eval $(gpg-agent --daemon --default-cache-ttl 3600 --max-cache-ttl 28800)

xmonad &
#xscreensaver &
xautolock -time 15 -locker xtrlock &
twmnd &
conky -q -d
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
	#tkabber &
	#psi-plus &
	echo $DISPLAY > ~/.config/display
}
sleep 2

if [[ ! -d ~/mnt/xmpp/roster ]]; then
	hatexmpp-mount &
fi
#setkeymap ru
keyboard-setup
xbindkeys
# Touchpad-based laptop
#synclient MaxSpeed=5 CircularScrolling=0 VertEdgeScroll=0 VertTwoFingerScroll=1 EmulateTwoFingerMinW=8 EmulateTwoFingerMinZ=1
# Trackpoint-based laptop
synclient VertTwoFingerScroll=1 HorizTwoFingerScroll=1 EmulateTwoFingerMinW=0 EmulateTwoFingerMinZ=1
#transmission-gtk &
sleep 1000d
