#!/bin/bash
type git
if [ $? == 1 ];then
	# not mac system
	if [ "$(uname)" != "Darwin" ]; then
		sudo apt update
		sudo apt install -y git
	else
		brew install git
	fi
fi
git clone https://gitee.com/mirrorvim/vim-fast
cd vim-fast
./install.sh
