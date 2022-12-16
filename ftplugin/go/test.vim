
" for gopl coc-go
if exists('g:did_coc_loaded')
	" test
	nnoremap <buffer><space>xe :CocCommand go.test.generate.exported<cr>
	nnoremap <buffer><space>xf :CocCommand go.test.generate.function<cr>
	nnoremap <buffer><space>xn :CocCommand go.test.generate.file<cr>
	nnoremap <buffer><space>xg :CocCommand go.test.toggle<cr>
	" tag
	nnoremap <buffer><space>xa :CocCommand go.tags.add.prompt<cr>
	nnoremap <buffer><space>xd :CocCommand go.tags.remove.prompt<cr>
	" auto format
	augroup GoFormat
		autocmd!
		autocmd BufWritePre *.go call CocAction('format')
	augroup END
endif

func! s:CodeRun()
	write
	let s:name=expand('%:p')
	if match(expand('%'),"test")==-1
		exec ":vert term go run ".expand('%:p')
	else
		exec ":vert term go test -v ".expand('%:p:h')
	endif
endfunc
nnoremap <buffer><space>xx :call <sid>CodeRun()<cr>
