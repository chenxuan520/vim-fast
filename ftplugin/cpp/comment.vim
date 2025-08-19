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
	let g:nvim_term_open=1
	if filereadable(expand('%:p:h')."/Makefile")||filereadable(expand('%:p:h')."/makefile")
		if has('nvim')
			exec ":vsplit|term make"
		else
			exec ":vert term make"
		endif
	elseif filereadable(expand('%:p:h')."/CMakeLists.txt")
		if has('nvim')
			exec ":vsplit|term cmake ."
		else
			exec ":vert term cmake ."
		endif
	else
		echo "using g++,please wait..."
		call system("g++ ".expand('%:p'))
		if has('nvim')
			exec ":vsplit|term ./a.out"
		else
			exec ":vert term ./a.out"
		endif
	endif
endfunc
nnoremap <buffer><space>xx :call <sid>Run()<cr>

" 设置cpp缩进
call g:SetTypeIndex("space", 2)
" 设置折行
setlocal wrap
noremap <buffer> j gj
noremap <buffer> k gk
" 设置使用tagbar,vista对cpp支持太差了
nnoremap <buffer> <silent><leader>t :Tagbar<cr>

" for gopl coc-clangd
if exists('g:did_coc_loaded')
	" auto format
	augroup CppFormat
		autocmd!
		autocmd BufWritePre *.c,*.cpp,*.h,*.hpp silent! call CocAction('format')
	augroup END
endif
