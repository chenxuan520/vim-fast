#!/bin/bash
wget https://gitee.com/mirrorvim/vim-fast/raw/master/vimrc-no-plug ~/.vimrc
mkdir ~/.vim
mkdir ~/.vim/colors
cd ~/.vim/colors
wget https://gitee.com/mirrorvim/vim-fast/raw/master/colors/tokyonight.vim
sed "s/desert/tokyonight/g" ~/.vimrc
