function git_prompt_info() {
  if [[ "$(git config --get oh-my-zsh.hide-status)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    GIT_BRANCH_NAME=${ref#refs/heads/}
    ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}$GIT_BRANCH_NAME"
    ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%}$GIT_BRANCH_NAME"
    echo "$(parse_git_dirty)"
  fi  
}
PROMPT='$(git_prompt_info)%{$fg_bold[cyan]%}➜ %{$reset_color%}%{$fg[blue]%}%1d%{$reset_color%} '
