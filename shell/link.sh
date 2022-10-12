#!/bin/bash
mv ~/.vimrc ~/.vimrc.bak
ln -s ${PWD}/.vimrc ~/.vimrc
cp -r ./colors ~/.vim/
cp -r ./autoload ~/.vim/
cp -r ./ftplugin ~/.vim/
