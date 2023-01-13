"======================================================================
"
" multcursor
"
" update by chenxuan 2023-01-12 09:55:08
"
"TODO
"======================================================================

let s:able=0
let s:hl_define=0
let s:match_dict={}
let s:last_dict={}

func! s:HlDefine()
	if !exists("s:hl_define")||s:hl_define==0
		let s:hl_define=1
		highlight MultCursorHl font=#000000 guifg=#1a1b26 guibg=#7da6ff
	endif
		highlight MultCursorHl font=#000000 guifg=#1a1b26 guibg=#7da6ff
endfunc

func! multcursor#Oper()
	let old=getpos('.')
	let pos=line('.')
	for [key,val] in items(s:match_dict)
		if key!=pos
			call cursor(key,val["col"])
			execute "normal! ."
		endif
		call matchdelete(s:match_dict[key]["hl"])
	endfor
	call cursor([old[1],old[2]])
	silent! nunmap <buffer> I
	silent! nunmap <buffer> A
	let s:last_dict=s:match_dict
	let s:match_dict={}
	let s:able=0
endfunc

func! multcursor#Disable()
	for [key,val] in items(s:match_dict)
		silent! call matchdelete(s:match_dict[key]["hl"])
	endfor
	silent! au! MultCursor
	silent! nunmap <buffer> I
	silent! nunmap <buffer> A
	let s:last_dict=s:match_dict
	let s:match_dict={}
	let s:able=0
endfunc

func! multcursor#Toggle() abort
	if !exists("s:last_dict")
		echo "open select before"
		return
	endif
	if s:able==1
		call multcursor#Disable()
		return
	endif
	let s:able=1
	call s:HlDefine()
	call s:InitCmd()
	let s:match_dict=s:last_dict
	for [key,val] in items(s:match_dict)
		let m=matchaddpos("MultCursorHl", [[key,val["col"],1]])
		let s:match_dict[key]={"col":col('.'),"hl":m}
	endfor
endfunc

func! s:Init()
	let s:able=1
	let s:match_dict={}
	let s:last_dict={}
	call s:HlDefine()
	call s:InitCmd()
endfunc

func! multcursor#Choose() abort
	if !exists("s:able")||s:able==0
		call s:Init()
	endif
	let pos=line('.')
	if has_key(s:match_dict,pos)
		let temp=s:match_dict[pos]["col"]
		call matchdelete(s:match_dict[pos]["hl"])
		unlet s:match_dict[pos]
		if temp==col('.')
			return
		endif
	endif
	let m=matchaddpos("MultCursorHl", [[line('.'),col('.'),1]])
	let s:match_dict[pos]={"col":col('.'),"hl":m}
endfunc


func! s:InitCmd()
	nnoremap <buffer> I i
	nnoremap <buffer> A a
	augroup MultCursor
		au!
		autocmd BufDelete,BufLeave <buffer> ++once call multcursor#Disable()|au! MultCursor
		autocmd InsertLeave <buffer> ++once call multcursor#Oper()|au! MultCursor
	augroup END
endfunc
