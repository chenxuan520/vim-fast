#!/bin/bash
rm ./vim.tar.gz
cd ~/.vim/plugged
mv ./coc.nvim ~/.vim/
tar -zcvf vim.tar.gz .
mv ~/.vim/coc.nvim ~/.vim/plugged
mv ./vim.tar.gz ~/vim-fast
