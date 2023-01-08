
if match(expand('%'),"curl")==-1
	finish
endif

nnoremap <silent><buffer><space>xx :w<cr>:vert term curl -K <c-r>=expand('%:p')<cr><cr>
