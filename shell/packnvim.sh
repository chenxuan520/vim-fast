#!/bin/bash

# this file is for author pack the plug,don't run it

ignore="$HOME/.local/share/nvim/lazy/coc.nvim"
temp="$HOME/.local/share/nvim/coc.nvim"
plug_dir="$HOME/.local/share/nvim/lazy"
tmp_plug_dir="$HOME/.local/share/nvim/"
tar_name="nvim.tar.gz"

rm ./$tar_name
mv $ignore $tmp_plug_dir
cd $plug_dir
tar -zcvf ~/vim-fast/$tar_name -C $plug_dir ./*
mv $temp $plug_dir/

# mkdir -p ~/vim-fast/plugged
# tar -zxvf ~/vim-fast/nvim.tar.gz -C ~/vim-fast/plugged/
# ls ~/vim-fast/plugged
# rm -rf ~/vim-fast/plugged
