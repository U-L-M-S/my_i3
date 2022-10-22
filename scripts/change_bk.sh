#!/bin/bash

while :
do
	
	WLPDIR1="$HOME/Mega/wallpapers/"
	WLPDIR2="$HOME/Mega/wallpapers/"

	files1=($WLPDIR1*)
	files2=($WLPDIR2*)

	wlpfile1=${files1[RANDOM % ${#files1[@]}]}
	wlpfile2=${files2[RANDOM % ${#files2[@]}]}
	#printf "Setting wallpaper to %s\n" "$wlpfile1"
	feh --bg-fill "$wlpfile1"  --bg-fill "$wlpfile2"

	sleep 90
done
