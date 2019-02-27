if infocmp tmux-256color &> /dev/null; then
  echo "terminfo loaded"
else
  echo "regenerating tmux-256color"
  tic -x ~/.local/share/terminfo/tmux
fi
