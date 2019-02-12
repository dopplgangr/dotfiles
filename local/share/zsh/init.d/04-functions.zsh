DOTFILES_ZSH_FUNCTIONS=~/.local/share/zsh/functions.d
if [[ -d ${DOTFILES_ZSH_FUNCTIONS} ]]; then
  fpath=( "${DOTFILES_ZSH_FUNCTIONS}" "${fpath[@]}" )
  for func in ${DOTFILES_ZSH_FUNCTIONS}/*(:t); do
    autoload -Uz "${func}"
  done
fi
