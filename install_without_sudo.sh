#!/bin/bash

# 拷贝文件
function copy_files()
{
	rm -rf ~/.vimrc
	ln -s ${PWD}/.vimrc ~

	mkdir ~/.vim
	rm -rf ~/.vim/colors
	ln -s ${PWD}/colors ~/.vim

	rm -rf ~/.vim/ftplugin
	ln -s ${PWD}/ftplugin ~/.vim

	rm -rf ~/.vim/autoload
	ln -s ${PWD}/autoload ~/.vim
}

# 安装coc插件
function install_plug()
{
	mkdir ~/.vim/plugged
	tar -zxvf ${PWD}/vim.tar.gz -C ~/.vim/plugged/
	# curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
	npm config set registry https://registry.npmmirror.com
	# https://registry.npmjs.org/
	# npm install -g yarn
	git clone -b release https://gitclone.com/github.com/neoclide/coc.nvim ~/.vim/plugged/coc.nvim
	# cd ~/.vim/plugged/coc.nvim
	# yarn install
	# yarn build
	vim -c "PlugInstall" -c "q" -c "q"
	chmod 664 ~/.viminfo
}

# 安装vim插件
function install_vim_plugin()
{
	vim -c "PlugInstall" -c "q" -c "q"
}

# 安装linux平台字体
function install_fonts_on_linux()
{
	mkdir -p ~/.local/share/fonts
	rm -rf ~/.local/share/fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf
	cp ./fonts/Droid\ Sans\ Mono\ Nerd\ Font\ Complete.otf ~/.local/share/fonts

	fc-cache -vf ~/.local/share/fonts
}

# 打印logo
function print_logo()
{
	color="$(tput setaf 6)"
	normal="$(tput sgr0)"
	printf "${color}"
	echo 'Just enjoy it!'
	echo 'p.s. Follow me at https://github.com/chenxuan520.'
	echo ''
	printf "${normal}"
}

# 开始安装vimplus
function begin_install_vimplus()
{
	copy_files
	install_fonts_on_linux
	install_plug
	print_logo
}

function main(){
	begin_install_vimplus
}
 
main
