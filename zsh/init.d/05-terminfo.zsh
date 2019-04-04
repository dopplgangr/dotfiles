if ! infocmp tmux-256color &> /dev/null; then
  log_warning "regenerating tmux-256color"
  tic -x ~/.local/share/terminfo/tmux
fi

DOTFILES_DIRCOLORS=${HOME}/.config/dircolors
if [ -f ${DOTFILES_DIRCOLORS} ]; then
  eval "$(command dircolors ${DOTFILES_DIRCOLORS})"
fi
