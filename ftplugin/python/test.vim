
" for pyright
if exists('g:did_coc_loaded')
	" test
	nnoremap <buffer><space>xf :CocCommand pyright.fileTest<cr>
	nnoremap <buffer><space>xs :CocCommand pyright.singleTest<cr>
endif
