source ~/.local/share/common.sh

# Skip zplug initialization if it's not available
[[ -f ~/.local/share/zplug/init.zsh ]] || return

source ~/.local/share/zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
# module order
SPACESHIP_PROMPT_ORDER=(
	user
	host
	char
	dir
	git
	docker
)

SPACESHIP_USER_PREFIX=""
SPACESHIP_USER_SUFFIX=""

#HOST
SPACESHIP_HOST_PREFIX="@:("
SPACESHIP_HOST_SUFFIX=") "

SPACESHIP_DIR_PREFIX='' # disable directory prefix, cause it's not the first section
SPACESHIP_DIR_TRUNC='1' # show only last directory


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
