#!/bin/bash
vim -c "CocInstall coc-sh@0.6.1 coc-json coc-snippets coc-vimlsp"
vim -c "CocInstall coc-explorer"
echo "nmap <leader>N :CocCommand explorer<CR>" >> ~/.vimrc
