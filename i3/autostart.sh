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
# xrandr --output HDMI-1 --mode 1920x1080 --output DP-1 --mode 1920x1080 --left-of HDMI-1

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

### Restart the sctipt that changes background automatically
if ps -C change_bk.sh; then
  killall change_bk.sh
  sh ~/.config/scripts/change_bk.sh &
else
  sh ~/.config/scripts/change_bk.sh &
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

### Start pidswallow (swallow programm)
pgrep -fl 'pidswallow -gl' || pidswallow -gl

run nm-applet &
#run volumeicon &
run polybar -c ~/.config/i3/polybar/config &
# Set correct size for all programs
#xrandr --dpi 84 &
# Change imagens every 90 secs
sh ~/.config/scripts/change_bk.sh & 
# Start Swallow script
sh ~/.config/scripts/swallow_i3.py &
