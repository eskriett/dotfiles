#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx

setxkbmap gb                                                    # Set GB keyboard layout for Xorg
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources     # Set xserver resource database
feh --recursive --randomize --bg-fill ~/.wallpapers &           # Set wallpapers
exec i3                                                         # Start i3 window manager
