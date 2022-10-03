#!/usr/bin/env bash

###### Set kitty theme ######
function ktheme() {
kitty_dir=~/.config/kitty	

KittyCat() {
clear
cat << EOF

      (Miau)
\   /\ \/
 ) ( ') 
(  / )
 \(_)|

EOF
}

	kdark() {
		cat $kitty_dir/dark > $kitty_dir/kitty.conf
		kitty @ set-colors --all .config/kitty/kitty.conf > /dev/null
		KittyCat
	}

	klight() {
		cat $kitty_dir/light > $kitty_dir/kitty.conf
		kitty @ set-colors --all .config/kitty/kitty.conf > /dev/null
		KittyCat
	}


	case $1 in
		-d) kdark ;;
		-l) klight ;;
	esac
}

ttheme() {
	case $1 in
		-d) tmux source-file .tmux/themes/dark.conf ;;
		-l) tmux source-file .tmux/themes/light.conf ;;
	esac
}

# function to do an ls for each cd
function lcd {
    builtin cd "$@" && logo-ls;
}

topy() {
    history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n 21
}
