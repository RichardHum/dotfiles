#!/bin/sh
syndaemon -t -k -i 1 -d &
echo OFF > /sys/kernel/debug/vgaswitcheroo/switch&

if [[ $1 == "xmonad" ]]
then
    numlockx &
    xsetroot -cursor_name left_ptr
    xmonad 
elif [[ $1 == "openbox" ]]
then
    numlockx &
    xsetroot -cursor_name left_ptr
    openbox
elif [[ $1 == "dwm" ]]
then
    numlockx &
    xsetroot -cursor_name left_ptr
    dwm
elif [[ $1 == "i3" ]]
then
    numlockx &
    xsetroot -cursor_name left_ptr
    i3
    /usr/bin/start-pulseaudio-x11
else
    numlockx &
    xsetroot -cursor_name left_ptr
    i3
    /usr/bin/start-pulseaudio-x11
fi
