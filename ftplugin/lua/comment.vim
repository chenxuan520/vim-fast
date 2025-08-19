
" set index for lua script
call g:SetTypeIndex("space", 4)

" for gopl coc-sumneko-lua
if exists('g:did_coc_loaded')
	" auto format
	augroup LuaFormat
		autocmd!
		autocmd BufWritePre *.lua silent! call CocAction('format')
	augroup END
endif
