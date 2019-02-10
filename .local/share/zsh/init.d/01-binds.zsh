# ensure terminal is in application mode
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }

  function zle-line-finish() {
    echoti rmkx
  }

  zle -N zle-line-init
  zle -N zle-line-finish
fi

bindkey -v

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^L" clear-screen
bindkey "^K" kill-line
bindkey "^U" backward-kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

if [[ -n "${terminfo[kcbt]}" ]]; then
  bindkey "^${terminfo[kcbt]}" reverse-menu-complete
fi

if [[ -n "${terminfo[kLFT5]}" ]]; then
  bindkey "^${terminfo[kLFT5]}" backward-word
fi

if [[ -n "${terminfo[kRIT5]}" ]]; then
  bindkey "^${terminfo[kRIT5]}" forward-word
fi

bindkey '^?' backward-delete-char                     # [Backspace] - delete backward

if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi

# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi


