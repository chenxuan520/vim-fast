#!/bin/bash
read -p "please input your name:" name
read -p "please input your email:" email
sed -c -i "s/chenxuan[^5]/${name}'/g" ~/.vimrc
sed -c -i "s/ chenxuan/ ${name}/g" ~/.vimrc
sed -i "s/chenxuan/${name}/g" ~/.vim/ftplugin/*/comment.vim
sed -i "s/1607772321@qq.com/${email}/g" ~/.vimrc
sed -i "s/1607772321@qq.com/${email}/g" ~/.vim/ftplugin/*/comment.vim
echo "change ok"
