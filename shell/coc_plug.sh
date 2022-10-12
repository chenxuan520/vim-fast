#!/bin/bash
vim -c "CocInstall coc-explorer coc-snippets"
echo "nmap <Leader>N <Cmd>CocCommand explorer<CR>" >> ~/.vimrc
