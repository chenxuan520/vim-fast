#!/bin/bash

# this file is for author pack the plug,don't run it

mv ~/.vim/plugged/coc.nvim ~/.vim/
tar -zcvf vim.tar.gz ~/.vim/plugged/*
mv ~/.vim/coc.nvim ~/.vim/plugged/
