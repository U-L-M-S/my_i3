typeset -aHg YS_PROMPT_SEGMENTS=(
  prompt_start
  prompt_context
  prompt_dir
  prompt_git
  prompt_end
)

prompt_start() {
  print -n "%B%F{blue}%#%b%f "
}

prompt_context() {
  print -n "%(#,%K{yellow}%F{black}%n%k%f,%F{cyan}%n%f) @ %F{green}%m%f "
}

prompt_dir() {
  print -n "in %B%F{yellow}%~%b%f "
}

prompt_git() {
  print -n "$vcs_info_msg_0_"
}

prompt_end() {
  print -n "[%*] %(?,,C:%F{red}%?%f)\n%F{red}$%f "
}

prompt_ys_main() {
  for prompt_segment in "${YS_PROMPT_SEGMENTS[@]}"; do
    [[ -n $prompt_segment ]] && $prompt_segment
  done
}

prompt_ys_precmd() {
  vcs_info
  PROMPT='$(prompt_ys_main)'
}

prompt_ys_setup() {
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  prompt_opts=(cr subst percent)

  add-zsh-hook precmd prompt_ys_precmd

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' check-for-changes false

  zstyle ':vcs_info:git:*' formats 'on %s:%F{cyan}%b%f %m '
  zstyle ':vcs_info:git*+set-message:*' hooks git-branch-status
}

+vi-git-branch-status() {
  if [[ -n $(git status --porcelain --ignore-submodules=dirty | head -n1) ]] ; then
    hook_com[misc]='%F{red}x%f'
  else
    hook_com[misc]='%F{green}o%f'
  fi
}

prompt_ys_setup "$@"
