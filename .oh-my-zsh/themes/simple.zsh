#!/usr/bin/env zsh

# Will generate random colors, every zsh session
rd="%B%F{$((RANDOM % 100))}"

magenta="#ff77ba"
green="#99ffab"
blue="#1a99ff"

Arrow="❭"
Git=""

# Simple, just use a prompt indicator, and indicate if a directory contains git files.
# The indicator contains 100 different colors, which change randomly with each session.
simple(){

	simple_prompt(){
		if git rev-parse --git-dir > /dev/null 2>&1; then
			echo "%B%F{$magenta}$Git%F{$green}  Master $rd$Arrow %f"
		else
			echo "$B$rd$Arrow %f"
		fi
		}
	simple_rprompt() {
		echo -ne "%B%F{$blue}%n %fin %F{$magenta}$Arrow %f%(4~|%-1~/.../%2~|%~)"
	}

PS1='$(simple_prompt)'
RPS1='$(simple_rprompt)'
}

simple