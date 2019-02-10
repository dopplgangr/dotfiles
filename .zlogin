#Install plugins if there are plugins that have not been installed
if [[ -f /usr/share/zplug/init.zsh ]]; then
  ZPLUG_UPDATE_INTERVAL=7200 # 2 hours
  ZPLUG_LAST_UPDATE=${ZPLUG_LAST_UPDATE:="$(date -u +'%s')"}
  ZPLUG_NEXT_UPDATE=$((ZPLUG_LAST_UPDATE+$ZPLUG_UPDATE_INTERVAL))

  if ! zplug check && [[ $ZPLUG_NEXT_UPDATE -lt $(date +'%s') ]]; then
    zplug install
    ZPLUG_LAST_UPDATE=$(date +'%s')
  fi
fi
