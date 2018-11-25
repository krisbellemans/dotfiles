#!/bin/bash

xrdb .Xresources
#xsetroot -solid "#073642"
xsetroot -solid "#002b36"

light-locker --lock-on-suspend &

if [ -x /usr/bin/xfce4-power-manager ] ; then
   sleep 1
   xfce4-power-manager &
fi

if [ -x /usr/bin/xfce4-volumed ] ; then
   sleep 1
   xfce4-volumed &
fi

nm-applet --sm-disable &
blueman-applet &
radiotray &

#while true; do
#   xsetroot -name "$( date + "%F %I:%M %p" )"
#   sleep 10
#done &

(conky | while read LINE; do xsetroot -name "$LINE"; done) &
exec /usr/local/bin/dwm
