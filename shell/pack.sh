#!/bin/bash

# this file is for author pack the plug,don't run it

ignore="$HOME/.vim/plugged/coc.nvim $HOME/.vim/plugged/copilot.vim $HOME/.vim/plugged/tokyonight.nvim"
temp="$HOME/.vim/coc.nvim $HOME/.vim/copilot.vim $HOME/.vim/tokyonight.nvim"

rm ./vim.tar.gz
mv $ignore ~/.vim/
cd ~/.vim/plugged
tar -zcvf ~/vim-fast/vim.tar.gz -C ~/.vim/plugged ./*
mv $temp ~/.vim/plugged/

mkdir -p ~/vim-fast/plugged
tar -zxvf ~/vim-fast/vim.tar.gz -C ~/vim-fast/plugged/
ls ~/vim-fast/plugged
rm -rf ~/vim-fast/plugged
