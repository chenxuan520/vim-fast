#!/bin/bash
rm ./vim.tar.gz
wget https://gitee.com/mirrorvim/vim-coc/releases/download/vim-plugv1.0.3/vim.tar.gz
tar -zxvf ${PWD}/vim.tar.gz -C ~/.vim/plugged/
