
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
	if s:type=='hpp'||s:type=='h'
		if filereadable(s:name . 'c')
			let s:name=s:name.'c'
		else
			let s:name=s:name.'cpp'
		endif
	elseif s:type=='cpp'||s:type=='c'
		if filereadable(s:name . 'h')
			let s:name=s:name.'h'
		else
			let s:name=s:name.'hpp'
		endif
	endif
	let @s=s:name
endfunc

nnoremap <silent><buffer><leader>C  :call <sid>HppCppturn()<cr>:e <c-r>=@s<cr><cr>

if exists('g:did_coc_loaded')
	nnoremap <silent><buffer><leader>C :CocCommand clangd.switchSourceHeader<cr>
endif

func! s:Enter()
	let s:str=getline('.')
	let s:col=col('.')-2
	echo s:str[s:col].'pis'
	while s:str[s:col]==' '||s:str[s:col]==nr2char(9)
		let s:col-=1
		if s:col<=0
			break
		endif
	endwhile
	if s:col<=0
		return "\<cr>"
	endif
	if s:str[s:col]=='{'||s:str[s:col]==';'||s:str[s:col]=='>'||s:str[0]=='#'
				" \||s:str[s:col]==')'
		return "\<cr>"
	endif
	echo s:str[s:col].'is'
	return ";\<cr>"
endfunc

if get(g:,"cpp_enter",0)
	inoremap <silent><expr><buffer><c-m> <sid>Enter()
endif
