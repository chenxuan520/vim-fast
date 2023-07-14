" fast add comment for cpp
func s:SetComment()
	call append(line("."),'/***********************************************')
	call append(line(".")+1,'* Author: chenxuan-1607772321@qq.com')
	call append(line(".")+2,'* change time:'.strftime("%Y-%m-%d %H:%M:%S"))
	call append(line(".")+3,'* description:')
	call append(line(".")+4,'* example: ')
	call append(line(".")+5,'***********************************************/')
endfunc
" set preparecode in buffernew
func! VimFastSetPreCode()
	call precode#CreateCode()
endfunc
nnoremap <buffer><Leader>c :call <SID>SetComment()<CR>

func! s:Run()
	if filereadable(expand('%:p:h')."/Makefile")||filereadable(expand('%:p:h')."/makefile")
		exec ":vert term make"
	elseif filereadable(expand('%:p:h')."/CMakeLists.txt")
		exec ":vert term cmake ."
	else
		echo "using g++,please wait..."
		call system("g++ ".expand('%:p'))
		exec ":vert term ./a.out"
	endif
endfunc
nnoremap <buffer><space>xx :call <sid>Run()<cr>
