DOTFILES_ZSH_FUNCTIONS=~/.local/share/zsh/functions.d
if [[ -d ${DOTFILES_ZSH_FUNCTIONS} ]]; then
  fpath=( "${DOTFILES_ZSH_FUNCTIONS}" "${fpath[@]}" )
  for func in ${DOTFILES_ZSH_FUNCTIONS}/*(:t); do
    autoload -Uz "${func}"
  done
fi

DOTFILES_COMMON_FUNCTIONS=~/.local/share/shell/functions.d
if [[ -d ${DOTFILES_COMMON_FUNCTIONS} ]]; then
	fpath=( "${DOTFILES_COMMON_FUNCTIONS}" "${fpath[@]}" )
	for func in ${DOTFILES_COMMON_FUNCTIONS}/*(:t); do
		echo "sourcing function:"
		source "${func}"
	done
fi
