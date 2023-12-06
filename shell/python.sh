#!/bin/bash
# echo -e "{\n\t\"python.pythonPath\" : \"/usr/bin/python3\"\n}" > ~/.vim/coc-settings.json
pip3 install autopep8
vim -c "CocInstall coc-pyright"
