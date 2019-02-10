if [[ -f ~/.local/share/zplug/init.zsh ]]; then
  source ~/.local/share/zplug/init.zsh
  zplug "zsh-users/zsh-autosuggestions"
  zplug "zsh-users/zsh-completions"
  zplug "zsh-users/zsh-history-substring-search", defer:2
  zplug "zsh-users/zsh-syntax-highlighting", defer:3
  zplug load
fi

zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
autoload -Uz compinit && compinit

_git_status() {
  if [[ -d .git || $(git rev-parse --git-dir >/dev/null 2>&1) ]]; then
    git rev-parse --abbrev-ref HEAD >/dev/null 2>&1 && echo "%F{white}[git:$(git rev-parse --abbrev-ref HEAD)] $(git diff --no-ext-diff --quiet --exit-code && echo '✔' || echo '✗')%f "
  fi
}

eval $(gpg-agent --daemon --quiet --enable-ssh-support >/dev/null 2>&1)
