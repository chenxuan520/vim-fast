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

	ln -s ${PWD}/coc/coc-settings.json ~/.vim/coc-settings.json
}

# 安装coc插件
function install_plug()
{
	mkdir ~/.vim/plugged
	./shell/plug.sh
	# curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

	./shell/nodejs.sh 0
	type node
	if [ $? == 1 ];then
		npm config set registry https://registry.npmmirror.com
		echo 'coc.nvim:registry https://registry.npmmirror.com' >> ~/.npmrc
		# https://registry.npmjs.org/
		# npm install -g yarn
		git clone -b release https://gitee.com/zgpio/coc.nvim.git ~/.vim/plugged/coc.nvim
		cd ~/.vim/plugged/coc.nvim
		git reset --hard v0.0.81

		# cd ~/.vim/plugged/coc.nvim
		# yarn install
		# yarn build
		vim -c "PlugInstall" -c "qa"
	fi

	if [ -d ~/.vim/plugged/vim-airline/autoload/airline/extensions ];then
		mv ${PWD}/vimscript/branch.vim ~/.vim/plugged/vim-airline/autoload/airline/extensions
		# mv ${PWD}/vimscript/coc.vim ~/.vim/plugged/vim-airline/autoload/airline/extensions
	fi

	chmod 664 ~/.viminfo

	mkdir ~/.local;mkdir ~/.local/bin

	wget https://gitee.com/mirrorvim/userful-tools-2/releases/download/ctagsv1.0.0/ctags -O ~/.local/bin/ctags
	chmod +x ~/.local/bin/ctags

	wget https://gitee.com/mirrorvim/userful-tools-2/releases/download/lfv1.0.0/lf -O ~/.local/bin/lf
	chmod +x ~/.local/bin/lf

	wget https://gitee.com/mirrorvim/userful-tools-2/releases/download/rgv1.0.0/rg.tar.gz
	tar -zxvf ./rg.tar.gz -C ~/.local/bin
	mv ./ripgrep-13.0.0-x86_64-unknown-linux-musl/rg ~/.local/bin/rg
	rm -rf ./ripgrep-13.0.0-x86_64-unknown-linux-musl ./rg.tar.gz

	wget https://gitee.com/mirrorvim/userful-tools-2/releases/download/cmdv1.0.0/lazygit.tar.gz
	tar -zxvf ./lazygit.tar.gz -C ~/.local/bin
	chmod +x ~/.local/bin/lazygit
	rm ./lazygit.tar.gz ~/.local/bin/README.md ~/.local/bin/LICENSE
}

# 安装vim插件
function install_vim_plugin()
{
	vim -c "PlugInstall" -c "qa"
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
	echo '       _            __          _   '
	echo '      (_)          / _|        | |  '
	echo '__   ___ _ __ ___ | |_ __ _ ___| |_ '
	echo '\ \ / / | "_ " _ \|  _/ _" / __| __|'
	echo ' \ V /| | | | | | | || (_| \__ \ |_ '
	echo '  \_/ |_|_| |_| |_|_| \__,_|___/\__|'
	echo ''
	echo 'install ok'
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
