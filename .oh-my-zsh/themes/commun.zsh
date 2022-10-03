#!/usr/bin/env zsh

green="#99ffab"
blue="#1a99ff"
red="#dc9191"


commun() {

	autoload -Uz vcs_info
	precmd() { vcs_info }

	zstyle ':vcs_info:git:*' formats '%b '
	
	setopt PROMPT_SUBST
	PS1='%F{$green}%t%f %F{$blue}%~%f %F{$red}${vcs_info_msg_0_}%f$ '
}

commun
