#!/bin/bash
wget https://gitee.com/mirrorvim/vim-fast/raw/master/vimrc-no-plug -O ~/.vimrc
if [ ! -d "~/.vim" ];then
  mkdir ~/.vim
fi
if [ ! -d "~/.vim/colors" ];then
  mkdir ~/.vim/colors
fi
cd ~/.vim/colors
wget https://gitee.com/mirrorvim/vim-fast/raw/master/colors/tokyonight.vim
sed -i "s/desert/tokyonight/g" ~/.vimrc
