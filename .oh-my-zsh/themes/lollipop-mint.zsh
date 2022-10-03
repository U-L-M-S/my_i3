#!/usr/bin/env zsh

# Colors
local red="#ff77ba"
local green="#81ffab"
local blue="#9a99ff"
local black="#212128"

# Symbols
local left=""
local right=""
local arrow=""
local gits=""

# Main

function main()
{

	function gits(){
		if git rev-parse --git-dir > /dev/null 2>&1; then
			echo "%F{blue}$left%K{blue} %F{red}$gits %F{white}Main %F{blue}%k$right%f"
		fi
	}

	function lollypop()
	{
		echo -ne "%B%F{red}$left%K{red}%F{white} %T %F{green}%K{green} %F{white}%c %k%F{green}$right%f $(gits) %F{blue}$arrow%f "
	}

	PS1='$(lollypop)'
}

main