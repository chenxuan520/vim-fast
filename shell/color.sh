#!/bin/bash
# wget https://gitee.com/mirrorvim/vim-fast/releases/download/v1.0.3/color.tar.gz
if [ ! -d "~/.vim" ]; then
  mkdir ~/.vim
fi
tar -zxvf color.tar.gz -C ~/.vim
