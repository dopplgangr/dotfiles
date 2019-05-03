#!/bin/sh
# Build zsh from sources

repo="git://zsh.git.sf.net/gitroot/zsh/zsh"
workdir=/tmp/zsh-$(uuidgen)
tag="zsh-5.7.1"

git clone "${repo}" "${workdir}"
cd "${workdir}"
git checkout "${tag}"

# set up the configure script
./Util/preconfig
./configure --prefix=/usr/local \
						--bindir=/usr/local/bin \
						--mandir=/usr/local/share/man \
						--infodir=/usr/local/share/info \
						--enable-maildir-support \
						--enable-max-jobtable-size=256 \
						--enable-etcdir=/etc/zsh \
						--enable-function-subdirs \
						--enable-site-fndir=/usr/local/share/zsh/site-functions \
						--enable-fndir=/usr/local/share/zsh/functions \
						--with-tcsetpgrp \
						--enable-cap \
						--enable-pcre \
						--enable-readnullcmd=pager \
						--enable-custom-patchlevel="dopplgangr"
						LDFLAGS="-Wl,--as-needed -g"

make
make check
sudo make install
sudo make install.info
