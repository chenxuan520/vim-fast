" for vim debug
call plug#begin('~/.vim/plugged')
Plug 'puremourning/vimspector'
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

" light line
call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
call plug#end()

" lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'separator': {'left': '', 'right': ''},
      \ 'subseparator': {'left': ' ', 'right': ' '}
      \ }

" bufferline
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#icon_position = 'right'
let g:lightline#bufferline#show_number = 3

let g:lightline#bufferline#number_map = {
\ 0: '⁰', 1: '¹ ', 2: '² ', 3: '³ ', 4: '⁴ ',
\ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}

function LightlineBufferlineFilter(buffer)
  return getbufvar(a:buffer, '&buftype') !=# 'terminal'
endfunction
let g:lightline#bufferline#buffer_filter = "LightlineBufferlineFilter"

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
call plug#end()

" fzf
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf.vim'
call plug#end()
" # find dir
" fd() {
"   local dir
"   dir=$(find ${1:-${HOME}} \( -path '*/\.*' -o -path "*/go/pkg" -o -path "*/node_modules" \) -prune -o -type d -print 2> /dev/null | \
"     fzf +m --layout=reverse --preview "ls -ah {}") &&
"   cd "$dir"
" }
" # find file to edit
" fe() {
"   local file=""
"   file=`fzf --layout=reverse --preview 'head -64 {}'`
"   if [ "$file" =  "" ] ;then
" 	  return
"   fi
"   vim $file
" }
" # find in vim
" fv() {
"   local file=""
"   file=`fzf --layout=reverse --preview 'head -64 {}' --preview-window=down`
"   printf '\033]51;["call","Tapi_EditFile",["%s/%s","exit"]]\007' $PWD $file
" }
" # find history
" fh() {
"   eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
" }
" alias fzf='fzf --layout=reverse --preview "head -64 {}"'
