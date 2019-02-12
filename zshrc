#Bail out if we're not an interactive shell
[[ -o nointeractive ]] && return

# Process init directory
for include in ~/.local/share/zsh/init.d/* ; do
  source "$include"
done

export PROMPT='%B%F{white}%~%f%b $(_git_status)› '
