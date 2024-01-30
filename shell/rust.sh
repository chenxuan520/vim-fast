#!/bin/bash
echo "Warning! make sure vim version greater than 8.2 or use nvim,or it will not effort"
type rustc
if [ $? == 1 ];then
	export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
	export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi
type rust-analyzer
if [ $? == 1 ]; then
	wget https://gitee.com/mirrorvim/userful-tools-2/releases/download/cmdv1.0.0/rust-analyzer-x86_64-unknown-linux-gnu
	chmod +x ./rust-analyzer-x86_64-unknown-linux-gnu
	mkdir ~/.local
	mkdir ~/.local/bin
	ln -s $PWD/rust-analyzer-x86_64-unknown-linux-gnu  ~/.local/bin/rust-analyzer
fi
rustup component add rust-analyzer

vim -c "CocInstall coc-rust-analyzer"
