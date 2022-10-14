#!/bin/bash
vim -c "CocInstall coc-explorer coc-snippets coc-json"
echo "nmap <Leader>N <Cmd>CocCommand explorer<CR>" >> ~/.vimrc
