#!/bin/sh

RESOURCES=$HOME/.Xresources
MODMAP=$HOME/.Xmodmap
SYS_RESOURCES=/etc/X11/xinit/.Xresources
SYS_MODMAP=/etc/X11/xinit/.Xmodmap

## X Configs
if [ -f "$SYS_RESOURCES" ]; then
	xrdb -merge $SYS_RESOURCES
fi

if [ -f "$SYS_MODMAP" ]; then
	xmodmap "$SYS_MODMAP"
fi

if [ -f "$RESOURCES" ]; then
	xrdb -merge "$RESOURCES"
fi

if [ -f "$MODMAP" ]; then
	xmodmap "$MODMAP"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi


## Input
xbindkeys
ibus-daemon --xim &
xset m 0 0 # Disable mouse acceleration


## Audio
export SDL_AUDIODRIVER=alsa

if [ -x $HOME/.jack.sh ]; then
	$HOME/.jack.sh &
fi

mpd ~/.mpdconf
mpdscribble &

## Font tweaking
INFINALITY=/etc/profile.d/infinality-settings.sh
if [ -x $INFINALITY ]; then
	$INFINALITY
fi

## Start WM
exec awesome --no-argb

