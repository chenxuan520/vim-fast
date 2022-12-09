#!/bin/bash
wget https://gitee.com/mirrorvim/vim-fast/raw/master/vimrc-no-plug -O ~/.vimrc
if [ ! -d "~/.vim" ];then
  mkdir ~/.vim
fi
if [ ! -d "~/.vim/colors" ];then
  mkdir ~/.vim/colors
fi
cd ~/.vim/colors
file_name="~/.vim/colors/tokyonight.vim"
if [ $file_name ]; then
  echo "$file_name exists"
else
  wget https://gitee.com/mirrorvim/vim-fast/raw/master/colors/tokyonight.vim
fi
