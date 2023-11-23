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
	ln -s $PWD/init.vim ~/.config/nvim/init.vim
	ln -s $PWD/coc/coc-settings.json ~/.config/nvim/coc-settings.json
	ln -s $PWD/autoload ~/.config/nvim/autoload
	ln -s $PWD/ftplugin ~/.config/nvim/ftplugin
	cp $PWD/shell/nvr.py ~/.config/nvim/nvr.py
	cp -r $PWD/colors ~/.config/nvim/
	pip3 install neovim
	pip3 install pynvim
	color="$(tput setaf 6)"
	normal="$(tput sgr0)"
	printf "${color}"
	echo '       _            __          _   '
	echo '      (_)          / _|        | |  '
	echo '__   ___ _ __ ___ | |_ __ _ ___| |_ '
	echo '\ \ / / | "_ " _ \|  _/ _" / __| __|'
	echo ' \ V /| | | | | | | || (_| \__ \ |_ '
	echo '  \_/ |_|_| |_| |_|_| \__,_|___/\__|'
	echo ''
	echo "nvim install ok"
	echo 'Just enjoy it!'
	echo 'p.s. Follow me at https://github.com/chenxuan520.'
	echo ''
	printf "${normal}"
}
main
