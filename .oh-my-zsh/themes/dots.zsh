#!/usr/bin/env zsh

# Will generate random colors, every zsh session
rd="%B%F{$((RANDOM % 100))}"

# Colors
green="#99ffab"
magenta="#ff77ba"
orange="#f16301"
blue="#1a99ff"

Git=""
Arrow=""
Simbolic1="━"
Arch=""

line() {
	Git(){
		if git rev-parse --git-dir > /dev/null 2>&1; then
			echo "%F{$orange}$Git%F{$green} Master%f"
		else
			echo "%F{$blue}$Arch%f Arch Linux"
		fi
	}

	Lin() {
		Line=$(tput cols)
		if git rev-parse --git-dir > /dev/null 2>&1; then
			Sum="$(( $Line / 2 - 5 ))"
		else
			Sum="$(( $Line / 2 - 7 ))"
		fi

		for x in $(seq 1 $Sum); do
    		qtd="$qtd"
    		line="$qtd$Simbolic1"
    		echo -ne "$line\c"
		done
	}

	line_prompt() {
    	echo  -e "${rd}$(Lin)%f $(Git) ${rd}$(Lin) %f%n in %F{$magenta}%c $rd$Arrow %f"
	}

	r_prompt()
	{
		echo -e "%w, %T"	
	}

PS1='$(line_prompt)'
RPS1='$(r_prompt)'
}

line