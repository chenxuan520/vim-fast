#!/bin/bash
echo -e "{\n\t\"python.pythonPath\" : \"/usr/bin/python3\"\n}" > ~/.vim/coc-settings.json
vim -c "CocInstall coc-pyright" 
