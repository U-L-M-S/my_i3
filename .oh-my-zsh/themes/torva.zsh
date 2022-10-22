#!/usr/bin/env zsh

# Colors
green="#99ffab"
magenta="#ff77ba"
orange="#f16301"

# Will generate random colors, every zsh session
local rd="%B%F{$((RANDOM % 100))}"
# Prompt indicator
local indicator="λ"
# Git dir indicator
local git=""

torva() {

get_cps_num_lock() {
  caps=$(xset q | grep Caps | cut -d ':' -f3 | awk '{print $1}')
  num=$(xset q | grep Caps | cut -d ':' -f5 | awk '{print $1}')

  if [[ $caps == on ]]; then
    echo -e "%F{$green} %fCapsLock \c "
  fi

  if [[ $num == on ]]; then
    echo -e "%F{$green} %fNumLock \c "
  fi
}

torva_git() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    echo "%F{$orange}$git %f"
  fi
}

torva_prompt() {
	echo "${rd}$indicator%f"
}

torva_rprompt() {
	#echo "$(get_cps_num_lock) [%F{$green}%c%f] $(torva_git)"
	echo "[%F{$green}%(5~|%-2~/…/%2~|%4~)%f] $(torva_git)"
}

PS1='$(torva_prompt) '
RPS1='$(torva_rprompt)'

}

torva
