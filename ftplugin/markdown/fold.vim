
if get(g:,"markdown_simple_disable",0)
	finish
endif

if !get(g:,"markdown_fold_enable",1)
	finish
endif

func! g:VimFastFoldExpr()
	if line('$')==v:lnum-1
		return '<1'
	endif
	let s:next=getline(v:lnum+1)
	let s:now=getline(v:lnum)
	let s:pre=getline(v:lnum-1)

	if match(s:pre, '^\s*#') >= 0
		return '>1'
	elseif match(s:next,'^\s*#') >=0
		return '<1'
	else
		return '='
	endif
endfunc

setlocal foldexpr=VimFastFoldExpr()
setlocal fdm=expr
setlocal fen

nnoremap <silent><buffer><nowait>=z :setlocal fdm=expr<cr>:setlocal fen<cr>
