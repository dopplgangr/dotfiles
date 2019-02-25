export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export CLICOLOR_FORCE=1
export KEYTIMEOUT=1
export EDITOR="nvim"
export MANPAGER="nvim -c 'set ft=man' -"
# export PAGER="nvim -R"
export PATH="$HOME/.local/bin:/usr/local/bin/:/usr/local/sbin/:$PATH"

# set up local go env if it exists
if [ -d ${HOME}/go ]; then 
  GOPATH=$HOME/go
  export PATH=$GOPATH/bin:$PATH
fi

alias vi='nvim'
alias vim='nvim'

alias ls='ls -h --color=auto'
alias ll='ls -hl --color=auto'
alias la='ls -hla --color=auto'
alias lp="ls -hla --color=auto | ${PAGER}"

alias grep='grep --color=auto'

alias df="df -Tha --total"
alias du="du -ach | sort -h"
alias free="free -mt"
alias ps="ps auxf"
