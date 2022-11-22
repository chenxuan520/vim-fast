" fast add comment for cpp
func s:SetComment()
	call append(line(".")+0,'# Author: chenxuan-1607772321@qq.com')
	call append(line(".")+1,'# change time:'.strftime("%Y-%m-%d %H:%M:%S"))
	call append(line(".")+2,'# description:')
	call append(line(".")+3,'# example: ')
endfunc
" set preparecode in buffernew
func! VimFastSetPreCode()
	call append(line(".")-1,'#!/usr/bin/env python')
	call append(line(".")-1,'# coding=utf-8')
endfunc
nnoremap <buffer><Leader>c :call <SID>SetComment()<CR>

nnoremap <buffer><silent>xx :vert term python3 <c-r>=expand('%:p')<cr><cr>
