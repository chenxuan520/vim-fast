#!/bin/bash
read -p "please input your name:" name
read -p "please input your email:" email
sed --follow-symlinks -i "s/chenxuan[^5]/${name}'/g" ~/.vimrc
sed --follow-symlinks -i "s/ chenxuan/ ${name}/g" ~/.vimrc
sed --follow-symlinks -i "s/chenxuan[^5]/${name}'/g" ~/.config/nvim/init.vim
sed --follow-symlinks -i "s/ chenxuan/ ${name}/g" ~/.config/nvim/init.vim
sed -i "s/chenxuan/${name}/g" ~/.vim/ftplugin/*/comment.vim
sed -i "s/1607772321@qq.com/${email}/g" ~/.vimrc
sed -i "s/1607772321@qq.com/${email}/g" ~/.config/nvim/init.vim
sed -i "s/1607772321@qq.com/${email}/g" ~/.vim/ftplugin/*/comment.vim
echo "change ok"
