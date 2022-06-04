#!/bin/bash
type go
if [ $? == 1 ];then
	sudo apt-get install wget
	sudo apt-get remove golang
	wget https://studygolang.com/dl/golang/go1.18.3.linux-amd64.tar.gz 
	sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.14.3.linux-amd64.tar.gz
	sudo ln -s /usr/bin/go /usr/local/go/bin/go
	sudo ln -s /usr/bin/gofmt /usr/local/go/bin/gofmt
fi
vim -c "CocInstall coc-go" 

