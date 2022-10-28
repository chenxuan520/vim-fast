" TODO
fun! s:AddTitle()
	execute "normal! ^"
	let col = col('.') - 1
	let s:char= getline('.')[col]
	if s:char=='#'
		execute "normal! i#"
	else
		execute "normal! i#\ "
	endif
endfun

func! s:AddSub()
	execute "normal! ^"
	let col = col('.') - 1
	let s:char= getline('.')[col]
	if s:char=='-'
		execute "normal! 2x"
	else
		execute "normal! i-\ "
	endif
endfunc

nnoremap <silent><buffer>#     :call <sid>AddTitle()<cr>
nnoremap <silent><buffer>-     :call <sid>AddSub()<cr>
