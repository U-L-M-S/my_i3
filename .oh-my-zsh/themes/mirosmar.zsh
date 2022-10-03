#!/usr/bin/env zsh

# Colors
black="#0e1001"
purple="#9a99ff"
blue="#1a99ff"
green="#99ffab"
magenta="#ff77ba"
red="#dc9191"
orange="#f16301"

Arq=$(find &>/dev/null | wc -l)
GitUser=$(cat ~/.gitconfig | grep name | cut -d = -f2 | sed 's/^ //')
Git=""
GitSatatus=""
GitOk=""
Arrow=""
User=""
Dir=""
Size=""

mirosmar() {

	git_status() {
		if git rev-parse --git-dir > /dev/null 2>&1; then
			modfy=$(git status -s > /dev/null 2>&1 | wc -l)
			if [[ $modfy -eq 0 ]]; then
				echo "%F{$orange}$User %F{$blue}$GitUser %F{$green}$Git%f Master "
			else
				echo "%F{$orange}$User %F{$blue}$GitUser %F{$red}$GitSatatus%f Modified "
			fi
		fi
	}

	mirosmar_prompt() {
		echo -ne "$(git_status)%F{$blue}%n%f@%F{$green}%m%F{$magenta} $Arrow %f"
	}

	mirosmar_rprompt() {
		read size name <<< $(du -hs `pwd` 2> /dev/null)
			echo -ne "in %F{$orange}%(4~|%-1~/.../%2~|%~) %F{$red}$Size %F{$blue}$size %F{$green}$Dir %F{$purple} $Arq%f"
	}

PS1='$(mirosmar_prompt)'
RPS1='$(mirosmar_rprompt)'

}

mirosmar