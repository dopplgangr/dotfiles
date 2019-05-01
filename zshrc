#Bail out if we're not an interactive shell
[[ -n "${DOTFILES_PROFILE}" ]] && zmodload zsh/zprof
[[ -o nointeractive ]] && return

if [ -d ~/.local/ ]; then
  PATH=~/.local/bin:$PATH
  MANPATH=~/.local/share/man:$MANPATH
  INFOPATH=~/.local/share/info:$INFOPATH
fi

if [ -d /opt/bin ]; then
  PATH=$PATH:/opt/bin
  MANPATH=$MANPATH:/opt/man
  INFOPATH=$INFOPATH:/opt/info
fi

# Process init directory
for file in ~/.local/share/zsh/init.d/*.zsh; source $file

unsetopt beep                                           # Turn off bell noise
setopt prompt_subst
setopt inc_append_history
setopt share_history
setopt histignorespace

# just in case other scripts have messed up our path orders
source ~/.zshenv
