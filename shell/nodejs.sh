#!/bin/bash
type node
if [ $? == 1 ];then
	NODEVERSION='v18.13.0'
	PKGNAME=node-${NODEVERSION}-linux-x64.tar.xz
	URL=https://nodejs.org/dist/${NODEVERSION}/${PKGNAME}
	PREFIX=/usr/local/
	wget https://nodejs.org/dist/${NODEVERSION}/${PKGNAME}
	sudo tar xf ${PKGNAME} \
		--exclude CHANGELOG.md \
		--exclude LICENSE \
		--exclude README.md \
		--strip-components 1 \
		-C "${PREFIX}"
fi
