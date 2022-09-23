#!/bin/bash
wget https://gitee.com/mirrorvim/vim-fast/releases/download/v1.0.2/doc.tar.gz
tar -zxvf ./doc.tar.gz
ln -s ${PWD}/vimcdoc/doc ~/.vim/doc 
