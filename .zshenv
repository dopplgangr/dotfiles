export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history

export CLICOLOR_FORCE=1
export KEYTIMEOUT=1
export TERM="$([[ $TMUX ]] && echo 'screen-256color' || echo 'xterm-256color')"
export EDITOR="vim"
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH"
export PROMPT='%B%F{white}%~%f%b $(_git_status)› '

export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
