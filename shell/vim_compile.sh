#!/bin/bash
sudo apt install -y python3-dev python-dev
sudo apt install -y libncurses5-dev
git clone --depth=1 https://gitee.com/mirrors/vim.git
cd vim
# ./configure --with-features=huge \
# 	--enable-multibyte \
# 	--enable-pythoninterp=dynamic \
# 	--with-python-config-dir=/usr/lib/python2.7/config \
# 	--enable-python3interp=dynamic \
# 	--enable-cscope \
# 	--enable-gui=auto \
# 	--enable-gtk2-check \
# 	--enable-fontset \
# 	--enable-largefile \
# 	--disable-netbeans \
# 	--enable-fail-if-missing \
# 	--prefix=/usr/local

./configure --with-features=huge \
	--enable-multibyte \
	--enable-pythoninterp=dynamic \
	--enable-python3interp=dynamic \
	--enable-gui=auto \
	--enable-gtk2-check \
	--enable-cscope \
	--enable-largefile \
	--enable-fail-if-missing \
	--prefix=/usr

make
sudo make install
