#!/bin/sh
# $XConsortium: xinitrc.cpp,v 1.4 91/08/22 11:41:34 rws Exp $

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi
/usr/bin/feh --bg-tile .bg.png
/usr/bin/numlockx on
(/usr/bin/conky -c /home/kris/.conky-dwm.cfg | while read REPLY; do xsetroot -name "$REPLY"; done) &
/usr/bin/xscreensaver -nosplash &
xset fp+ /home/kris/.fonts/xbm/
# Start the window manager:
if [ -z "$DESKTOP_SESSION" -a -x /usr/bin/ck-launch-session ]; then
  exec ck-launch-session /usr/bin/dwm
else
  exec /usr/local/src/dwm-6.0/dwm
  #exec /usr/bin/dwm
fi
