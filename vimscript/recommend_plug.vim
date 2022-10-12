" for vim debug
call plug#begin('~/.vim/plugged')
Plug 'puremourning/vimspector'
Plug 'preservim/vim-markdown'
call plug#end()

" vim spector map setting
let g:vimspector_enable_mappings = 'HUMAN'

" for vim markdown
call plug#begin('~/.vim/plugged')
Plug 'preservim/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

" markdown config
nmap <leader>mo <Plug>MarkdownPreviewToggle
nmap <leader>md :GenTocGFM<cr>
