#!/usr/bin/env zsh

white="#F5F5F5"
blue="#1a99ff"
green="#99ffab"
magenta="#ff77ba"
orange="#f16301"

Git=""
Arrow="❭"

declare -a Distros=('' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '')

get_distro() {
	distro_name=$(cat /etc/os-release | grep ID | sed -n 1p | cut -d = -f2)
		if [[ $distro_name == arch ]]; then
			echo -e "%F{$blue}${Distros[1]} "
		elif [[ $distro_name == debian ]]; then
			echo -e "%F{$red}${Distros[3]} "
		elif [[ $distro_name == fedora ]]; then
			echo -e "%F{$blue}${Distros[5]} "
		elif [[ $distro_name == gentoo ]]; then
			echo -e "%F{$purple}${Distros[6]} "
		elif [[ $distro_name == mint ]]; then
			echo -e "%F{$green}${Distros[8]} "
		elif [[ $distro_name == centos ]]; then
			echo -e "%F{$blue}${Distros[2]} "
		elif [[ $distro_name == elementary ]]; then
			echo -e "%F{$magenta}${Distros[4]} "
		elif [[ $distro_name == manjaro ]]; then
			echo -e "%F{$green}${Distros[10]} "
		elif [[ $distro_name == ubuntu ]]; then
			echo -e "%F{$orange}${Distros[15]} "
		elif [[ $distro_name == slackware ]]; then
			echo -e "%F{$blue}${Distros[14]} "
		elif [[ $distro_name == redhat ]]; then
			echo -e "%F{$red}${Distros[16]} "
		fi
}

powerone() {
	powerone_git(){
		if git rev-parse --git-dir > /dev/null 2>&1; then
			echo "%F{$orange} $Git %F{white} User%F{$blue} Master %f"
		fi
	}

	powerone_prompt() {
		echo -ne "$(get_distro)%f %m %F{$green}%(4~|%-1~/.../%2~|%~) $(powerone_git)%F{$magenta}$Arrow%f "
	}
PS1='$(powerone_prompt)'
}

powerone