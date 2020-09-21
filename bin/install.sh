#!/bin/bash

SCR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOT_DIR=$(dirname ${SCR_DIR})

for f in $DOT_DIR/.??*
do
	[[ `basename $f` == ".git" ]] && contiune
	ln -s $f $HOME/$f
done

