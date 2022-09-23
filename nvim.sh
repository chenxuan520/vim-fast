#!/bin/bash
function main(){
	echo 'it will change init.vim please make sure init.vim has be stored'
	read -p "continue?[y/n]" ch
	if [[ $ch == "n" ]] || [[ $ch == "N" ]]; then
		return
	fi
	type nvim
	if [ $? == 1 ];then
		sudo apt update
		sudo apt install -y neovim
	fi
	rm ~/.config/nvim/init.vim
	mkdir ~/.config/nvim
	ln -s $PWD/.vimrc ~/.config/nvim/init.vim 
	cp ~/.vim/coc-settings.json ~/.config/nvim/
	cp -r ./colors ~/.config/nvim/
	cp -r ./autoload ~/.config/nvim/
	cp -r ./ftplugin ~/.config/nvim/
	echo "nvim install ok"
}
main
