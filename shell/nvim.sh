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
