
if get(g:,"markdown_simple_disable",0)
	finish
endif

if !get(g:,"markdown_fold_enable",1)
	finish
endif

let b:fold_code_flag=1
func! g:VimFastFoldExpr()
	if line('$')==v:lnum-1
		return '<1'
	endif
	let s:next=getline(v:lnum+1)
	let s:now=getline(v:lnum)
	let s:pre=getline(v:lnum-1)

	if match(s:now,'^```')>=0
		let b:fold_code_flag=3-b:fold_code_flag
	endif

	if b:fold_code_flag==2
		return '1'
	endif

	if match(s:now,'^\s*#')>=0
		return '0'
	else
		return '1'
	endif
endfunc

setlocal foldexpr=VimFastFoldExpr()
setlocal fdm=expr
setlocal fen

nnoremap <silent><buffer><nowait>=z :setlocal fdm=expr<cr>:setlocal fen<cr>
