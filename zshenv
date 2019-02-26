export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export CLICOLOR_FORCE=1
export KEYTIMEOUT=1
export EDITOR="nvim"
export MANPAGER="nvim -c 'set ft=man' -"

export PATH="$HOME/.local/bin:/usr/local/bin/:/usr/local/sbin/:$PATH"

# set up local go env if it exists
if [ -d ${HOME}/go ]; then 
  GOPATH=$HOME/go
  export PATH=$GOPATH/bin:$PATH
fi

# moved these here so shells have access to them
DOTFILES_ZSH_FUNCTIONS=~/.local/share/zsh/functions.d
if [[ -d ${DOTFILES_ZSH_FUNCTIONS} ]]; then
  fpath+="${DOTFILES_ZSH_FUNCTIONS}"
  for func in ${DOTFILES_ZSH_FUNCTIONS}/_*(:t); do
    autoload -Uz "${func}"
  done

  for func in ${DOTFILES_ZSH_FUNCTIONS}/[^_]*; do
    source "${func}"
  done
fi

export LIBRARY_LOG_TIMESTAMP=1

alias vi='nvim'
alias vim='nvim'
alias ls='ls -Sh --group-directories-first --color=auto'
alias ll='ls -Shl --group-directories-first --color=auto'
alias la='ls -Shla --group-directories-first --color=auto'
alias lp="ls -Shla --group-directories-first --color=auto | ${PAGER}"
alias grep='grep --color=auto'
alias df="df -Tha --total"
alias du="du -ach | sort -h"
alias free="free -mt"
alias ps="ps auxf"
