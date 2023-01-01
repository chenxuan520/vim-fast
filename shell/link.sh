#!/bin/bash
if [ -f ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc.bak
fi
if [ -f ~/.gvimrc ]; then
	mv ~/.gvimrc ~/.gvimrc.bak
fi
ln -s ${PWD}/.vimrc ~/.vimrc
ln -s ${PWD}/.gvimrc ~/.gvimrc
cp -r ./colors ~/.vim/
cp -r ./autoload ~/.vim/
cp -r ./ftplugin ~/.vim/
