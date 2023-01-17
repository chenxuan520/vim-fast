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
	let s:filename=split(expand('%:p'),'\.')[-1]
	if s:filename=='cpp'
		call append(line(".")-1,'#include <iostream>')
		call append(line(".")-1,'#include <vector>')
		call append(line(".")-1,'#include <string>')
		call append(line(".")-1,'#include <unordered_map>')
		call append(line(".")-1,'using namespace std;')
		call append(line(".")+0,'int main()')
		call append(line(".")+1,'{')
		call append(line(".")+2,'	return 0;')
		call append(line(".")+3,'}')
	else
		call append(line(".")-1,'#pragma once')
	endif
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
