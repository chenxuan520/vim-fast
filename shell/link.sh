#!/bin/bash
if [ -f ~/.vimrc ]; then
	mv ~/.vimrc ~/.vimrc.bak
fi
# if [ -f ~/.gvimrc ]; then
# 	mv ~/.gvimrc ~/.gvimrc.bak
# fi
if [ -d ~/.vim/plugged/vim-airline/autoload/airline/extensions ];then
	ln -s ${PWD}/vimscript/branch.vim ~/.vim/plugged/vim-airline/autoload/airline/extensions/branch.vim
fi
ln -s ${PWD}/.vimrc ~/.vimrc
cp -r ./colors ~/.vim/
cp -r ./autoload ~/.vim/
cp -r ./ftplugin ~/.vim/
