#!/usr/bin/env zsh

# Will generate random colors, every zsh session
rd="%B%F{$((RANDOM % 100))}"

# Colors
green="#99ffab"
magenta="#ff77ba"
orange="#f16301"

Git=""
Arrow=""
Simbolic1="━"
Simbolic2="┍"
Simbolic3="└─"

line() {
	line_git(){
		if git rev-parse --git-dir > /dev/null 2>&1; then
			echo "%F{$orange}$Git%F{$green} Master%f "
		fi
	}

	Lin() {
		Line=$(tput cols)
		if git rev-parse --git-dir > /dev/null 2>&1; then
			Sum="$(( $Line - 17 ))"
		else
			Sum="$(( $Line - 7 ))"
		fi

		for x in $(seq 1 $Sum); do
    		qtd="$qtd"
    		line="$qtd$Simbolic1"
    		echo -ne "$line\c"
		done
	}

	line_prompt() {
    	echo  -e "${rd}$Simbolic2$(Lin)┙%f$(line_git)%T%f\n${rd}$Simbolic3%f %~ %F{$magenta}$Arrow%f "
	}

PS1='$(line_prompt)'
}

line