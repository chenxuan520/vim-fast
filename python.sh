#!/bin/bash
echo "{\n\t\"python.pythonPath\" : \"/usr/bin/python3\"\n}" > ~/.vim/coc-settings.json
vim -c "CocInstall coc-pyright" 
