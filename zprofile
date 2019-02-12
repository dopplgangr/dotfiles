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
