#!/bin/bash
wget https://gitee.com/mirrorvim/vim-fast/releases/download/v1.0.2/doc.tar.gz
tar -zxvf ./doc.tar.gz
mv ${PWD}/vimcdoc/doc ~/.vim/doc
rm ./doc.tar.gz
rm -rf ${PWD}/vimcdoc
