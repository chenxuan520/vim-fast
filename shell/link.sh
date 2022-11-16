#!/bin/bash
mv ~/.vimrc ~/.vimrc.bak
mv ~/.gvimrc ~/.gvimrc.bak
ln -s ${PWD}/.vimrc ~/.vimrc
ln -s ${PWD}/.gvimrc ~/.gvimrc
cp -r ./colors ~/.vim/
cp -r ./autoload ~/.vim/
cp -r ./ftplugin ~/.vim/
