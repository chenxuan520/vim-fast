
" for pyright
if exists('g:did_coc_loaded')
	" test
	nnoremap <buffer><space>xf :CocCommand pyright.fileTest<cr>
	nnoremap <buffer><space>xs :CocCommand pyright.singleTest<cr>
endif

nnoremap <silent><buffer><space>xx :vert term python3 <c-r>=expand('%:p')<cr><cr>
