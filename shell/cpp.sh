#!/bin/bash

# for mac install
if [ "$(uname)" == "Darwin" ]; then
	brew install llvm
	vim -c "CocInstall coc-clangd"
	exit 0
fi

# linux install
sudo apt update
sudo apt-get install -y wget clangd
type clangd
if [ $? == 1 ];then
	wget  https://gitee.com/mirrorvim/vim-coc/attach_files/1084289/download/clangd-linux-14.0.3.zip
	sudo unzip ./clangd-linux-14.0.3.zip
	sudo ln -s ./clangd_14.0.3/bin/clangd /usr/bin/clangd 
fi
# can download it by https://github.com/clangd/clangd/releases/download/15.0.6/clangd-linux-15.0.6.zip
vim -c "CocInstall coc-clangd" 
