#!/bin/bash

DOT_DIR=$HOME/dotfiles
mkdir -p $DOT_DIR

curl -sSL https://github.com/kohnhirn/dotfiles/tarball/master | tar -xvz -C $DOT_DIR --strip-components 1

cd $DOT_DIR
for f in .??*
do
	[[ `basename $f` == ".git" ]] && contiune
	ln -fs $f $HOME/$f
done

