#!/bin/bash
type go
if [ $? == 1 ];then
	sudo apt update
	sudo apt-get install -y wget
	sudo apt-get remove golang
	# it may be very slow,so advise to use apt intsall
	wget https://gomirrors.org/dl/go/go1.20.1.linux-amd64.tar.gz
	sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.3.linux-amd64.tar.gz
	sudo ln -s  /usr/local/go/bin/go /usr/bin/go
	sudo ln -s  /usr/local/go/bin/gofmt /usr/bin/gofmt
	go env -w GO111MODULE=on
	go env -w GOPROXY=https://goproxy.cn,direct
fi
type go
if [ $? == 1 ];then
	sudo apt-get install -y golang-go
fi
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
vim -c "CocInstall coc-go@1.2.1 coc-snippets"
