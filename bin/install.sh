#!/bin/bash

DOT_DIR=$HOME/dotfiles
mkdir -p $DOT_DIR

curl -sSL https://github.com/kohnhirn/dotfiles/tarball/master | tar -xvz -C $DOT_DIR --strip-components 1

for f in $DOT_DIR/.??*
do
	[[ `basename $f` == ".git" ]] && contiune
	ln -fs $f $HOME/$f
done

