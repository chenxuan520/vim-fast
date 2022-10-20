
func! s:HppCppturn()
	let s:type=split(expand('%:p'),'\.')[-1]
	let s:way=split(expand('%:p'),'\.')
	let s:name=""
	for s:temp in s:way
		if s:temp=='hpp'||s:temp=='cpp'
			continue
		endif
		let s:name =s:name.s:temp.'.'
	endfor
	if s:type=='hpp'
		let s:name=s:name.'cpp'
		let @s=s:name
	else
		let s:name=s:name.'hpp'
		let @s=s:name
	endif
endfunc

nnoremap <silent><leader>C  :call <sid>HppCppturn()<cr>:e <c-r>=@s<cr><cr>
