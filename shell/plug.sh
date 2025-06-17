#!/bin/bash
rm ./vim.tar.gz
mkdir -p ~/.vim/plugged/
wget https://gitee.com/mirrorvim/vim-fast/releases/download/latest/vim.tar.gz
tar -zxvf ${PWD}/vim.tar.gz -C ~/.vim/plugged/
ls -alh ~/.vim/plugged

git config --global --add safe.directory "*"
