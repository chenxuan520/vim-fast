" fast add comment for cpp
func s:SetComment()
	call append(line(".")+0,'// Author: chenxuan-1607772321@qq.com')
	call append(line(".")+1,'// change time:'.strftime("%Y-%m-%d %H:%M:%S"))
	call append(line(".")+2,'// description:')
	call append(line(".")+3,'// example: ')
endfunc
" set preparecode in buffernew
func! VimFastSetPreCode()
	if expand('%')=='main.go'
		call append(line(".")-1,'package main')
		return
	endif

	call append(line(".")-1,'package ' . split(expand('%:p'),'/')[-2])
endfunc
nnoremap <buffer><Leader>c :call <SID>SetComment()<CR>
