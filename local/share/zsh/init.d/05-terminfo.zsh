if infocmp tmux-256color &> /dev/null; then
  log_warning "regenerating tmux-256color"
  tic -x ~/.local/share/terminfo/tmux
fi
