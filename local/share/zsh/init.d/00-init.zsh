source ~/.local/share/common.sh

# Skip zplug initialization if it's not available
[[ -f ~/.local/share/zplug/init.zsh ]] || return

source ~/.local/share/zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:3
#zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# Install plugins that haven't been installed
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

# Source plugins && add commands to $PATH
zplug load

umask 022
