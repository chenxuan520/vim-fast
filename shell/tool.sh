#!/bin/bash
mkdir ~/.local 2>/dev/null
mkdir ~/.local/bin 2>/dev/null

function command_exists {
	if command -v "$1" &> /dev/null
	then
		return 0  # 返回0表示命令存在
	else
		return 1  # 返回1表示命令不存在
	fi
}

function file_exist(){
	if [ -f "$1" ]; then
		return 0
	else
		return 1
	fi
}

install_lazygit() {
	if command_exists "lazygit"; then
		echo "lazygit command exists"
		return
	fi
	wget https://gitee.com/mirrorvim/userful-tools-2/releases/download/cmdv1.0.0/lazygit.tar.gz
	tar -zxvf ./lazygit.tar.gz -C ~/.local/bin
	rm ./lazygit.tar.gz ~/.local/bin/README.md ~/.local/bin/LICENSE
}

install_ctags(){
	if command_exists "ctags"; then
		echo "ctags command exists"
		return
	fi
	wget https://gitee.com/mirrorvim/userful-tools-2/releases/download/ctagsv1.0.0/ctags -O ~/.local/bin/ctags
	chmod +x ~/.local/bin/ctags
}

install_lf(){
	if command_exists "lf"; then
		echo "lf command exists"
		return
	fi
	wget https://gitee.com/mirrorvim/userful-tools-2/releases/download/lfv1.0.0/lf -O ~/.local/bin/lf
	chmod +x ~/.local/bin/lf
}

install_fzf(){
	if command_exists "fzf"; then
		echo "fzf command exists"
		return
	fi
	wget https://gitee.com/mirrorvim/userful-tools-2/releases/download/cmdv1.0.0/fzf-0.36.0-linux_amd64.tar.gz
	tar -zxvf ./fzf-0.36.0-linux_amd64.tar.gz -C ~/.local/bin
	rm ./fzf-0.36.0-linux_amd64.tar.gz
}

install_nvr(){
	if file_exist ~/.config/nvim/nvr.py; then
		echo "nvr  exists"
		return
	fi
	mkdir -p ~/.config/nvim
	wget https://gitee.com/mirrorvim/vim-fast/raw/master/shell/nvr.py -O ~/.config/nvim/nvr.py
	chmod +x ~/.config/nvim/nvr.py
}

check_and_add_to_path(){
	if [[ ":$PATH:" == *":$HOME/.local/bin:"* ]]; then
		echo "~/.local/bin is already in your PATH."
	else
		read -p "Add ~/.local/bin to your PATH? (y/n) " choice
		if [ "$choice" = "y" ]; then
			echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
			export PATH="$HOME/.local/bin:$PATH"
			echo "~/.local/bin has been added to your PATH."
		else
			echo "No changes have been made to your PATH."
		fi
	fi
}

case "$1" in
	lazygit)
		install_lazygit
		check_and_add_to_path
		;;
	ctags)
		install_ctags
		check_and_add_to_path
		;;
	fzf)
		install_fzf
		check_and_add_to_path
		;;
	lf)
		install_lf
		check_and_add_to_path
		;;
	nvr)
		install_nvr
		;;
	*)
		echo $"Usage: $0 {lazygit|ctags|fzf|lf|nvr}"
		exit 2
		;;
esac
