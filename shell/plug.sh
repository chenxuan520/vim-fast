#!/bin/bash
rm ./vim.tar.gz
wget https://gitee.com/mirrorvim/vim-fast/releases/download/v1.0.14/vim.tar.gz
tar -zxvf ${PWD}/vim.tar.gz -C ~/.vim/plugged/
ls -alh ~/.vim/plugged

git config --global --add safe.directory "*"
