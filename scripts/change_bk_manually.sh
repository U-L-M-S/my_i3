#!/bin/bash

# DO NOT forget to put a copy of this script in the /usr/bin/
# Otherwise it will NOT work!!!

WLPDIR1="$HOME/MEGA/wallpapers/"
WLPDIR2="$HOME/MEGA/wallpapers/"


files1=($WLPDIR1*)
files2=($WLPDIR2*)

wlpfile1=${files1[RANDOM % ${#files1[@]}]}
wlpfile2=${files2[RANDOM % ${#files2[@]}]}
#printf "Setting wallpaper to %s\n" "$wlpfile1"
feh --bg-fill "$wlpfile1"  --bg-fill "$wlpfile2"

