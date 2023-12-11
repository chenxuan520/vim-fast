
func! PreviewNowFile(ch)
	silent! exec "silent! bd ".matchlist(getline('.'),b:regex)[1]
	if a:ch!=''
		exec "normal! ".a:ch
	endif
	let line=getline('.')
	let match=matchlist(line,b:regex)
	if len(match)>=3
		let file=match[1]
		let line=match[2]
		exe ':pedit +'.line.' '.file
	endif
endfunc

augroup QuickFixMap
	autocmd!
	autocmd BufLeave quickfix call <sid>QuickFixMap(0)|au! QuickFixMap
augroup END

let b:regex='\([^|]\+\)|\(\d\+\)'


func! s:QuickFixMap(is_set)
	if a:is_set
		nnoremap <buffer><silent> j :call PreviewNowFile('j')<cr>
		nnoremap <buffer><silent> k :call PreviewNowFile('k')<cr>
	else
		pclose
		exec "silent! bd".matchlist(getline('.'),b:regex)[1]
		silent! unmap <buffer> j
		silent! unmap <buffer> k
	endif
endfunc
nnoremap <buffer><silent><c-l> :call <sid>QuickFixMap(1)<cr>
nnoremap <buffer><silent><c-h> :call <sid>QuickFixMap(0)<cr>
