DOTFILES_ZSH_FUNCTIONS=~/.local/share/zsh/functions.d
if [[ -d ${DOTFILES_ZSH_FUNCTIONS} ]]; then
  fpath+="${DOTFILES_ZSH_FUNCTIONS}"
  for func in ${DOTFILES_ZSH_FUNCTIONS}/*(:t); do
    autoload -Uz "${func}"
  done
fi

DOTFILES_ZSH_COMPLETIONS=~/.local/share/zsh/completions.d
if [[ -d ${DOTFILES_ZSH_COMPLETIONS} ]]; then
  fpath+=${DOTFILES_ZSH_COMPLETIONS}
  for func in ${DOTFILES_ZSH_COMPLETIONS}/*; do
    source "${func}"
  done
fi
