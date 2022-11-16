
let s:mdfoldEnable=get(g:,"markdown_fold_enable",1)

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

if s:mdfoldEnable
	augroup mdfold
		au!
		au BufEnter   *.md set foldexpr=VimFastFoldExpr()|set fdm=expr|set fen
		au BufLeave   *.md set fdm=manual|set foldexpr="0"|set nofen|au! mdfold
	augroup END
endif
