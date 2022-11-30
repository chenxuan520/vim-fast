
" for gopl coc-go
if exists('g:did_coc_loaded')
	" test
	nnoremap <buffer><space>xe :CocCommand go.test.generate.exported<cr>
	nnoremap <buffer><space>xt :CocCommand go.test.generate.function<cr>
	nnoremap <buffer><space>xf :CocCommand go.test.generate.file<cr>
	nnoremap <buffer><space>xg :CocCommand go.test.toggle<cr>
	nnoremap <buffer><space>xr :vert term go test <c-r>=expand('%:p:h')<cr><cr>
	" tag
	nnoremap <buffer><space>xa :CocCommand go.tags.add.prompt<cr>
	nnoremap <buffer><space>xd :CocCommand go.tags.remove.prompt<cr>
endif

nnoremap <buffer><space>xx :w<cr>:vert term go run <c-r>=expand('%:p')<cr><cr>
