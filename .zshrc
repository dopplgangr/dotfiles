if [[ -f /usr/share/zplug/init.zsh ]]; then
  export ZPLUG_LOADFILE="${HOME}/.zplug/packages.zsh"
  source /usr/share/zplug/init.zsh
  zplug load
fi


for include in ~/.local/share/zsh/init.d/*; do
  echo "$include"
done

bindkey -v
unsetopt beep                                           # Turn off bell noise

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^L" clear-screen
bindkey "^K" kill-line
bindkey "^U" backward-kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

bindkey "^$terminfo[kRIT5]" forward-word
bindkey "^$terminfo[kLFT5]" backward-word
bindkey "^$terminfo[kcbt]" reverse-menu-complete

zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
autoload -Uz compinit && compinit

setopt prompt_subst
setopt inc_append_history
setopt share_history
setopt histignorespace

_git_status() {
  if [[ -d .git || $(git rev-parse --git-dir >/dev/null 2>&1) ]]; then
    git rev-parse --abbrev-ref HEAD >/dev/null 2>&1 && echo "%F{white}[git:$(git rev-parse --abbrev-ref HEAD)] $(git diff --no-ext-diff --quiet --exit-code && echo '✔' || echo '✗')%f "
  fi
}

eval $(gpg-agent --daemon --quiet --enable-ssh-support >/dev/null 2>&1)
