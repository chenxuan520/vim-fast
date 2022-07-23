#!/usr/bin/env bash

# 拷贝文件
function copy_files()
{
	rm -rf ~/.vimrc
	ln -s ${PWD}/.vimrc ~

	rm -rf ~/.vimrc.custom.plugins
	cp ${PWD}/.vimrc.custom.plugins ~

	rm -rf ~/.vimrc.custom.config
	cp ${PWD}/.vimrc.custom.config ~

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
	wget https://gitee.com/mirrorvim/vim-coc/attach_files/1084291/download/vim.tar.gz 
	tar -zxvf ${PWD}/vim.tar.gz -C ~/.vim/plugged/
	curl -sL install-node.now.sh | bash
	# curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
	npm install -g yarn
	git clone https://gitclone.com/github.com/neoclide/coc.nvim ~/.vim/plugged/coc.nvim
	cd ~/.vim/plugged/coc.nvim
	yarn install
	yarn build
	chmod 664 ~/.viminfo
	vim -c "PlugInstall" -c "q" -c "q"
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
	echo '        __                __           '
	echo '__   __/_/___ ___  ____  / /_  _______ '
	echo '\ \ / / / __ `__ \/ __ \/ / / / / ___/ '
	echo ' \ V / / / / / / / /_/ / / /_/ (__  )  '
	echo '  \_/_/_/ /_/ /_/ ,___/_/\____/____/   '
	echo '               /_/                     ...is now installed!'
	echo ''
	echo ''
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

# 安装ubuntu必备软件
function install_prepare_software_on_ubuntu()
{
	sudo apt-get update
	sudo apt-get install -y vim
	sudo apt-get install -y zip curl git wget
	sudo apt-get install -y build-essential python python-dev python3-dev fontconfig libfile-next-perl ack-grep
	sudo apt-get install -y universal-ctags || sudo apt-get install -y exuberant-ctags
}
# 安装debian必备软件
function install_prepare_software_on_debian()
{
	sudo apt-get update
	sudo apt-get install -y vim
	sudo apt-get install -y zip curl git wget
	sudo apt-get install -y build-essential python python-dev python3-dev fontconfig libfile-next-perl ack
	sudo apt-get install -y universal-ctags || sudo apt-get install -y exuberant-ctags
}


# 获取linux发行版名称
function get_linux_distro()
{
	if grep -Eq "Ubuntu" /etc/*-release; then
		echo "Ubuntu"
	elif grep -Eq "Deepin" /etc/*-release; then
		echo "Deepin"
	elif grep -Eq "Raspbian" /etc/*-release; then
		echo "Raspbian"
	elif grep -Eq "uos" /etc/*-release; then
		echo "UOS"
	elif grep -Eq "LinuxMint" /etc/*-release; then
		echo "LinuxMint"
	elif grep -Eq "elementary" /etc/*-release; then
		echo "elementaryOS"
	elif grep -Eq "Debian" /etc/*-release; then
		echo "Debian"
	elif grep -Eq "Kali" /etc/*-release; then
		echo "Kali"
	elif grep -Eq "Parrot" /etc/*-release; then
		echo "Parrot"
	elif grep -Eq "CentOS" /etc/*-release; then
		echo "CentOS"
	elif grep -Eq "fedora" /etc/*-release; then
		echo "fedora"
	elif grep -Eq "openSUSE" /etc/*-release; then
		echo "openSUSE"
	elif grep -Eq "Arch Linux" /etc/*-release; then
		echo "ArchLinux"
	elif grep -Eq "ManjaroLinux" /etc/*-release; then
		echo "ManjaroLinux"
	elif grep -Eq "Gentoo" /etc/*-release; then
		echo "Gentoo"
	elif grep -Eq "alpine" /etc/*-release; then
		echo "Alpine"
	else
		echo "Unknow"
	fi
}

# 获取日期
function get_datetime()
{
	time=$(date "+%Y%m%d%H%M%S")
	echo $time
}

# 判断文件是否存在
function is_exist_file()
{
	filename=$1
	if [ -f $filename ]; then
		echo 1
	else
		echo 0
	fi
}

# 判断目录是否存在
function is_exist_dir()
{
	dir=$1
	if [ -d $dir ]; then
		echo 1
	else
		echo 0
	fi
}

#备份原有的.vimrc文件
function backup_vimrc_file()
{
	old_vimrc=$HOME"/.vimrc"
	is_exist=$(is_exist_file $old_vimrc)
	if [ $is_exist == 1 ]; then
		time=$(get_datetime)
		backup_vimrc=$old_vimrc"_bak_"$time
		read -p "Find "$old_vimrc" already exists,backup "$old_vimrc" to "$backup_vimrc"? [Y/N] " ch
		if [[ $ch == "Y" ]] || [[ $ch == "y" ]]; then
			cp $old_vimrc $backup_vimrc
		fi
	fi
}

#备份原有的.vimrc.custom.plugins文件
function backup_vimrc_custom_plugins_file()
{
	old_vimrc_plugins=$HOME"/.vimrc.custom.plugins"
	is_exist=$(is_exist_file $old_vimrc_plugins)
	if [ $is_exist == 1 ]; then
		time=$(get_datetime)
		backup_vimrc_plugins=$old_vimrc_plugins"_bak_"$time
		read -p "Find "$old_vimrc_plugins" already exists,backup "$old_vimrc_plugins" to "$backup_vimrc_plugins"? [Y/N] " ch
		if [[ $ch == "Y" ]] || [[ $ch == "y" ]]; then
			cp $old_vimrc_plugins $backup_vimrc_plugins
		fi
	fi
}

#备份原有的.vimrc.custom.config文件
function backup_vimrc_custom_config_file()
{
	old_vimrc_config=$HOME"/.vimrc.custom.config"
	is_exist=$(is_exist_file $old_vimrc_config)
	if [ $is_exist == 1 ]; then
		time=$(get_datetime)
		backup_vimrc_config=$old_vimrc_config"_bak_"$time
		read -p "Find "$old_vimrc_config" already exists,backup "$old_vimrc_config" to "$backup_vimrc_config"? [Y/N] " ch
		if [[ $ch == "Y" ]] || [[ $ch == "y" ]]; then
			cp $old_vimrc_config $backup_vimrc_config
		fi
	fi
}

#备份原有的.vim目录
function backup_vim_dir()
{
	old_vim=$HOME"/.vim"
	is_exist=$(is_exist_dir $old_vim)
	if [ $is_exist == 1 ]; then
		time=$(get_datetime)
		backup_vim=$old_vim"_bak_"$time
		read -p "Find "$old_vim" already exists,backup "$old_vim" to "$backup_vim"? [Y/N] " ch
		if [[ $ch == "Y" ]] || [[ $ch == "y" ]]; then
			cp -R $old_vim $backup_vim
		fi
	fi
}

# 备份原有的.vimrc和.vim
function backup_vimrc_and_vim()
{
	backup_vimrc_file
	backup_vimrc_custom_plugins_file
	backup_vimrc_custom_config_file
	backup_vim_dir
}

# 安装debian必备软件
function install_prepare_software_on_debian()
{
	sudo apt-get update
	sudo apt-get install -y vim cmake build-essential python python-dev python3-dev fontconfig libfile-next-perl ack git
	sudo apt-get install -y universal-ctags || sudo apt-get install -y exuberant-ctags
}

# 在ubuntu上安装vimplus
function install_vimplus_on_ubuntu()
{
	backup_vimrc_and_vim
	install_prepare_software_on_ubuntu
	begin_install_vimplus
}

# 在debian上安装vimplus
function install_vimplus_on_debian()
{
	backup_vimrc_and_vim
	install_prepare_software_on_debian
	begin_install_vimplus
}

# 在linux平上台安装vimplus
function install_vimplus_on_linux()
{
	distro=`get_linux_distro`
	echo "Linux distro: "${distro}

	if [ ${distro} == "Ubuntu" ]; then
		install_vimplus_on_ubuntu
	elif [ ${distro} == "Deepin" ]; then
		install_vimplus_on_ubuntu
	elif [ ${distro} == "LinuxMint" ]; then
		install_vimplus_on_ubuntu
	elif [ ${distro} == "elementaryOS" ]; then
		install_vimplus_on_ubuntu
	elif [ ${distro} == "Debian" ]; then
		install_vimplus_on_debian
	elif [ ${distro} == "Raspbian" ]; then
		install_vimplus_on_debian
	elif [ ${distro} == "UOS" ]; then
		install_vimplus_on_debian
	elif [ ${distro} == "Kali" ]; then
		install_vimplus_on_debian
	else
		echo "Not support linux distro: "${distro}
	fi
}

# 获取当前时间戳
function get_now_timestamp()
{
	cur_sec_and_ns=`date '+%s-%N'`
	echo ${cur_sec_and_ns%-*}
}

function main(){
	begin=`get_now_timestamp`

	type=$(uname)
	echo "Platform type: "${type}

	if [ ${type} == "Linux" ]; then
		tp=$(uname -a)
		if [[ $tp =~ "Android" ]]; then
			echo "Android no support"
		else
			install_vimplus_on_linux
		fi
	else
		echo "Not support platform type: "${type}
	fi

end=`get_now_timestamp`
second=`expr ${end} - ${begin}`
min=`expr ${second} / 60`
echo "It takes "${min}" minutes."
}

main
