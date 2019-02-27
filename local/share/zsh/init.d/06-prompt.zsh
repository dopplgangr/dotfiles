_prompt_char='»'
_prompt_host="%m"
_prompt_user="%n"

_prompt_status() {
  echo " ${_prompt_char}"
}

_git_prompt_abbrev() {
  git rev-parse --abbrev-ref HEAD
}

_git_prompt_stash() {
  if git stash list | wc -l 
}

_git_prompt_modified() {
  git diff --no-ext-diff --quiet --exit-code && return 1 || return 0
}

_prompt_git() {
  if ! git rev-parse --git-dir --quiet &> /dev/null; then
    return
  fi

  local mods
  set -A mods
  if _git_prompt_modified; then
    mods+=("!")
  fi

  local modified=""
  if [[ ${#mods[@]} -gt 0 ]]; then
    modified=" [%F{red}${mods[@]}%f]"
  fi

  echo -n " on %F{magenta} $(_git_prompt_abbrev)%f${modified}"
}

# Note: all prompt components are responsible for their own left space padding if applicable
export PROMPT='${_prompt_user}@%F{yellow}${_prompt_host}%f$(_prompt_git)$(_prompt_status) '

# vim: set filetype=zsh
