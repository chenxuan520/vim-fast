#!/bin/bash
echo 'it will change init.vim please make sure init.vim has be stored'
read -p "continue?[y/n]" ch
if [[ $ch == "n" ]] || [[ $ch == "N" ]]; then
	return
fi
type nvim
if [ $? == 1 ];then
	sudo apt update
	sudo apt install neovim
fi
ln -s ~/.config/nvim/init.vim ./.vimrc
cp -r ./colors ~/.config/nvim/
