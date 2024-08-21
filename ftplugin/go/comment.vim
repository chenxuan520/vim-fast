" fast add comment for cpp
func s:SetComment()
	call append(line(".")+0,'// Author: chenxuan-1607772321@qq.com')
	call append(line(".")+1,'// change time:'.strftime("%Y-%m-%d %H:%M:%S"))
	call append(line(".")+2,'// description:')
	call append(line(".")+3,'// example: ')
endfunc
" set preparecode in buffernew
func! VimFastSetPreCode()
	" if str has main.go,make package main
	if match(expand('%:p'),'/main.go')!=-1
		call append(line(".")-1,'package main')
		return
	endif

	call append(line(".")-1,'package ' . split(expand('%:p'),'/')[-2])
endfunc
" auto get go.mod path way
func! s:GetModPath()
	let file=findfile("go.mod",".;")
	if file==""
		return
	endif
	for line in readfile(file)
		let list=matchlist(line,"^\\s*module\\s*\\(.*\\)$")
		if len(list)>1
			execute ':iab <buffer> mod "'.list[1].'/"<left>'
			break
		endif
	endfor
endfunc
nnoremap <buffer><Leader>c :call <sid>SetComment()<CR>
nnoremap <buffer><Leader>C :call <sid>GetModPath()<CR>

" 设置折行
setlocal wrap
noremap<buffer> j gj
noremap<buffer> k gk
