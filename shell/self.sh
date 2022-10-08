#!/bin/bash
read -p "please input your name:" name
sed -i "s/chenxuan[^5]/${name}/g" ~/.vimrc
read -p "please input your email:" email
sed -i "s/1607772321@qq.com/${email}/g" ~/.vimrc
