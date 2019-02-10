# Bail out if we're not an interactive shell
[[ -o nointeractive ]] && return

# Process init directory
for include in ~/.local/share/zsh/init.d/*; do
  source "$include"
done
