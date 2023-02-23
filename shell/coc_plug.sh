#!/bin/bash
vim -c "CocInstall coc-explorer coc-snippets coc-json"
vim -c "CocInstall coc-sh@0.6.1"
echo "nmap <leader>N :CocCommand explorer<CR>" >> ~/.vimrc
