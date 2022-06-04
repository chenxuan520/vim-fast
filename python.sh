#!/bin/bash
echo "{\"python.pythonPath\" : \"/usr/bin/python3\"}" > ~/.vim/coc-settings.json
vim -c "CocInstall coc-pyright" 
