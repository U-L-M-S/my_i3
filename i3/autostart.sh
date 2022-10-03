#!/bin/bash

# ┏━━━┓╋╋┏┓╋╋╋┏━━━┓┏┓╋╋╋╋╋┏┓
# ┃┏━┓┃╋┏┛┗┓╋╋┃┏━┓┣┛┗┓╋╋╋┏┛┗┓
# ┃┃╋┃┣┓┣┓┏╋━━┫┗━━╋┓┏╋━━┳┻┓┏┛
# ┃┗━┛┃┃┃┃┃┃┏┓┣━━┓┃┃┃┃┏┓┃┏┫┃
# ┃┏━┓┃┗┛┃┗┫┗┛┃┗━┛┃┃┗┫┏┓┃┃┃┗┓
# ┗┛╋┗┻━━┻━┻━━┻━━━┛┗━┻┛┗┻┛┗━┛

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

### Start 2 monitors ###
#xrandr --output HDMI1 --mode 1366x768 --pos 1600x0 --rotate normal --output VGA1 --primary --mode 1600x900 --pos 0x0 --rotate normal --output VIRTUAL1 --off

### Set keymap pt_br ###
setxkbmap -model abnt2 -layout br -variant abnt2

### Set custons cursors ###
xsetroot -cursor_name left_ptr &

### Do not turn off the screen ###
xset s off &
xset -dpms &

### Set composer ###
if ps -C picom; then
  killall picom
  picom &
else
  picom &
fi

### Set wallpaper ###
### Use nitrogen
nitrogen --restore &

### Use feh
# sh ~/.fehbg &

### Set notifications ###
### Use xfce4 notify ###
# exec /usr/lib/xfce4/notifyd/xfce4-notifyd &

### Use dunst ###
dunst &

run nm-applet &
#run volumeicon &
flameshot &
run polybar -c ~/.config/i3/polybar/config &
# Set correct size for all programs
#xrandr --dpi 84 &
# Change imagens every 90 secs
sh ~/.config/scripts/change_bk.sh & 
# Start Swallow script
sh ~/.config/scripts/swallow_i3.py &
# Start Picom with animations
