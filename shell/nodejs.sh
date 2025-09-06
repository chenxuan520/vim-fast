#!/bin/bash
echo "this script need root permission,if you don't have root permission,please download nodejs from https://nodejs.org/en/download/ and install it manually"

#check mac version
type=$(uname)
if [ ${type} == "Darwin" ]; then
	brew install node
	exit
fi


function AddPath()
{
	OLD_IFS="$IFS"
	IFS=":"
	arr=($PATH)
	IFS="$OLD_IFS"
	for s in ${arr[@]}
	do
		if [ $s == "$HOME/.local/bin" ]; then
			return
		fi
	done
	echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
}

type node
if [ $? == 1 ];then
	NODEVERSION='v22.19.0'
	PKGNAME=node-${NODEVERSION}-linux-x64.tar.xz
	URL=https://cdn.npmmirror.com/binaries/node/${NODEVERSION}/${PKGNAME}
	if [ $# == 0 ]; then
		PREFIX=/usr/local/
	else
        mkdir -p ~/.local
		PREFIX=~/.local/
		AddPath
	fi
	wget $URL
	sudo tar xf ${PKGNAME} \
		--exclude CHANGELOG.md \
		--exclude LICENSE \
		--exclude README.md \
		--strip-components 1 \
		-C "${PREFIX}"
fi
