#!/bin/bash

# this file is for author pack the plug,don't run it

rm ./vim.tar.gz
mv ~/.vim/plugged/coc.nvim ~/.vim/
cd ~/.vim/plugged
tar -zcvf ~/vim-fast/vim.tar.gz -C ~/.vim/plugged ./*
mv ~/.vim/coc.nvim ~/.vim/plugged/

mkdir -p ~/vim-fast/plugged
tar -zxvf ~/vim-fast/vim.tar.gz -C ~/vim-fast/plugged/
ls ~/vim-fast/plugged
rm -rf ~/vim-fast/plugged
