#!/bin/bash
sudo apt update
sudo apt-get install -y wget clangd
type clangd
if [ $? == 1 ];then
	wget  https://gitee.com/mirrorvim/vim-coc/attach_files/1084289/download/clangd-linux-14.0.3.zip
	sudo unzip ./clangd-linux-14.0.3.zip
	sudo ln -s ./clangd_14.0.3/bin/clangd /usr/bin/clangd 
fi
vim -c "CocInstall coc-clangd" 
