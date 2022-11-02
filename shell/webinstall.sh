#!/bin/bash
type git
if [ $? == 1 ];then
	sudo apt-get install -y git
fi
git clone https://gitee.com/mirrorvim/vim-fast
cd vim-fast
./install.sh
