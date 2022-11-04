
"======================================================================
"
" termtask
"
" Created by chenxuan on 2022.11.02
"
"======================================================================

if get(g:,"markdown_simple_disable",0)
	finish
endif

func! s:Format()
	let s:i=2
	let s:code=0
	while s:i<=line('$')
		let s:flag=1
		let s:str=getline(s:i)
		let s:ch=''

		for s:ch in str2list(s:str)
			if s:ch!=char2nr(' ')&&s:ch!=9
				if s:ch==char2nr('`')
					if s:code==0
						let s:code=1
					else
						let s:code=0
					endif
					let s:flag=0
				elseif s:ch==char2nr('>')||s:ch==char2nr('|')
					let s:flag=0
				endif

				break
			endif
		endfor

		if s:flag!=1
			let s:i=s:i+1
			continue
		endif

		if len(getline(s:i))!=0&&len(getline(s:i-1))!=0&&s:code==0
			call append(s:i-1,'')
			let s:i=s:i+1
		endif

		let s:i=s:i+1
	endwhile
endfunc

nnoremap <buffer><silent> <leader><leader>f :call <sid>Format()<cr>
