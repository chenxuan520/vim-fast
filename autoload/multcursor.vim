"======================================================================
"
" multcursor
"
" update by chenxuan 2023-01-12 09:55:08
"
"TODO
"======================================================================

let s:exec=""
let s:able=0
let s:hl_define=0
let s:match_dict={}

func! s:HlDefine()
	if !exists("s:hl_define")||s:hl_define==0
		let s:hl_define=1
		highlight MultCursorHl font=#000000 guifg=#1a1b26 guibg=#7da6ff
	endif
endfunc

func! multcursor#Oper()

endfunc

func! multcursor#Able()
	let s:exec=""
	let s:able=0
	call s:HlDefine()
	let @/="\\V".expand('<cword>')
	set nohlsearch
endfunc

func! multcursor#Move(direct)
	if s:able==0
		call multcursor#Able()
	endif
	if a:direct
		call feedkeys('n','in')
	else
		call feedkeys('N','in')
	endif
endfunc

func! multcursor#Choose(skip)
	let pos=line('.').col('.')
	if !a:skip
		let m=matchaddpos("MultCursorHl", [[line('.'),col('.'),len(expand('<cword>'))]])
		let s:match_dict[pos]=m
	else
		if has_key(s:match_dict,pos)
			call matchdelete(s:match_dict[pos])
			unlet s:match_dict[pos]
		endif
	endif
endfunc
