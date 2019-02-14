#Bail out if we're not an interactive shell
[[ -n "${DOTFILES_PROFILE}" ]] && zmodload zsh/zprof
[[ -o nointeractive ]] && return

# Process init directory
for include in ~/.local/share/zsh/init.d/* ; do
  source "$include"
done

