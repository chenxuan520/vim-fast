
func! PreviewNowFile(ch)
	pclose
	let line=getline('.')
	let match=matchlist(line,s:regex)
	if len(match)>=3
		let file=match[1]
		let line=match[2]
		exe ':pedit +'.line.' '.file
	endif
	if a:ch!=''
		call feedkeys(a:ch,'n')
	endif
endfunc

let s:regex='\([^|]\+\)|\(\d\+\)'

nnoremap <buffer><silent><c-l> :call PreviewNowFile('')<cr>
nnoremap <buffer><silent><c-h> :pclose<cr>:bd matchlist(line,s:regex)[1]<cr>
