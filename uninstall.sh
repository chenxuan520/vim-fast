#!/bin/bash

rm -rf ~/.vim
rm -rf ~/.vimrc

color="$(tput setaf 6)"
normal="$(tput sgr0)"

printf "${color}"
echo '       _            __          _   '
echo '      (_)          / _|        | |  '
echo '__   ___ _ __ ___ | |_ __ _ ___| |_ '
echo '\ \ / / | "_ " _ \|  _/ _" / __| __|'
echo ' \ V /| | | | | | | || (_| \__ \ |_ '
echo '  \_/ |_|_| |_| |_|_| \__,_|___/\__|'
echo ''
echo '  uninstall ok'
echo 'p.s. Follow me at https://github.com/chenxuan520.'
echo ''
printf "${normal}"
