#!/bin/zsh
alias res="reset"
alias q="exit"
alias c="clear"
alias cls="clear"
alias df="df -ahiT --total"
alias free="free -h"
alias grep='grep --color=auto'
alias tch='touch'
alias cd.='cd -'

# Trash-cli instead of rm
alias rm='trash-put'
alias undo='trash-restore'

# Changing "ls" to "exa"
alias lll='exa -aT --color=always --group-directories-first --icons' # tree listing
alias ll='exa -al --color=always --group-directories-first --icons' # my preferred listing
alias l='exa -l --color=always --group-directories-first --icons'  # long format
alias l.='exa -a | egrep "^\." --icons'

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# VIMs
alias v='nvim'
alias vv='vim'

# Configs
# Zsh
alias zconf="nvim ~/.zshrc"
alias zalias="nvim ~/.config/zsh/alias.zsh"

# Picom
alias picom-conf="nvim ~/.config/picom.conf"

# Debian family
alias aptse='sudo apt search "^$2" | grep $1'
alias aptupdate='sudo apt update'
alias aptupgrade='sudo apt upgrade'
alias aptin='sudo apt install'

# FVWM
alias fvconf='nvim ~/.fvwm/settings/settings.sh'
# KITTY
alias kittyconf='nvim ~/.config/kitty/kitty.conf'
