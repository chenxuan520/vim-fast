#!/bin/bash
vim -c "CocInstall coc-explorer coc-snippets coc-json"
echo "nmap <leader>N :CocCommand explorer<CR>" >> ~/.vimrc
