#!/bin/bash

# Set GB keyboard layout for Xorg
setxkbmap gb

# Set wallpapers
feh --recursive --randomize --bg-fill ~/.wallpapers

# Start i3 window manager
exec i3
