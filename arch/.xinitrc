#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

#merge in defaults and keymaps
#
#if [ -f $sysresources ]; then
#
#
#
#
#
#
#
#   xrdb -merge $sysresources
#
#fi
#
#if [ -f $sysmodmap ]; then
#    xmodmap $sysmodmap
#fi
# #if [ -f "$userresources" ]; then
#
#
#
#
#
#
#
#    xrdb -merge "$userresources"
#
#fi
#
#if [ -f "$usermodmap" ]; then
#    xmodmap "$usermodmap"
#fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrdb -merge ~/.Xresources &
setxkbmap -option caps:escape &

timedatectl set-timezone America/Chicago
sudo ntpd -qg

xrandr --output DP-0 --mode 1440x1080 --right-of HDMI-0
xrandr --output HDMI-0 --mode 2560x1440  --left-of DP-0

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
exec awesome
