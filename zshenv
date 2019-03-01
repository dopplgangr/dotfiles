export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export CLICOLOR_FORCE=1
export KEYTIMEOUT=1
export EDITOR="nvim"

export PATH="$HOME/.local/bin:/usr/local/bin/:/usr/local/sbin/:$PATH"

# set up local go env if it exists
if [ -d ${HOME}/go ]; then 
  GOPATH=$HOME/go
  export PATH=$GOPATH/bin:$PATH
fi

# set up local ruby env if it exists
if [ -d ${HOME}/.gem ]; then
  GEM_HOME=~/.local/share/ruby
  GEM_PATH="$GEM_HOME:$GEM_PATH"
  export PATH="/home/ctodie/.gem/ruby/2.5.0/bin:$PATH"
  mkdir -p "$GEM_HOME"
fi

# moved these here so shells have access to them
DOTFILES_ZSH_FUNCTIONS=~/.local/share/zsh/functions.d
if [[ -d ${DOTFILES_ZSH_FUNCTIONS} ]]; then
  fpath+="${DOTFILES_ZSH_FUNCTIONS}"
  for func in ${DOTFILES_ZSH_FUNCTIONS}/_*(N:t); do
    autoload -Uz "${func}"
  done

  for func in ${DOTFILES_ZSH_FUNCTIONS}/[^_]*(N); do
    source "${func}"
  done
fi

export LIBRARY_LOG_TIMESTAMP=1

mux() {
  tmuxinator "$@" 2>/dev/null
}

alias tssh='env TERM=screen-256color ssh'
alias edit='nvim'
alias vi='nvim'
alias vim='nvim'
#alias top='htop'
#alias mux='tmuxinator'
alias ls='ls -h --sort=extension --group-directories-first --color=auto'
alias ll='ls -hl --sort=extension --group-directories-first --color=auto'
alias la='ls -hla --sort=extension --group-directories-first --color=auto'
alias lp="ls -hla --sort=extension --group-directories-first --color=auto | ${PAGER}"
alias grep='grep --color=auto'
alias df="df -Tha --total"
alias du="du -ach | sort -h"
alias free="free -mt"
alias ps="ps auxf"

