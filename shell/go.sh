#!/bin/bash


# for mac install
if [ "$(uname)" == "Darwin" ]; then
	brew install go
	vim -c "CocInstall coc-go@1.2.1 coc-snippets"
	go env -w GO111MODULE=on
	go env -w GOPROXY=https://goproxy.cn,direct
	exit 0
fi

type go
if [ $? == 1 ];then
	sudo apt update
	sudo apt-get install -y wget
	sudo apt-get remove golang
	# it may be very slow,so advise to use apt intsall
	# https://golang.google.cn/dl/ or download form there
	wget https://golang.google.cn/dl/go1.22.0.linux-amd64.tar.gz
	sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz
	sudo rm /usr/bin/go
	sudo rm /usr/bin/gofmt
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
