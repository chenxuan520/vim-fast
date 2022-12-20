
let b:apidoc_enable=get(g:,"apidoc_enable",1)

if !b:apidoc_enable
	finish
endif

nnoremap <buffer><Leader>C :call apidoc#ApiComment()<CR>

command! -buffer ApiSuccess :call apidoc#ApiDefineSuccess()
command! -buffer ApiError   :call apidoc#ApiDefineError()
