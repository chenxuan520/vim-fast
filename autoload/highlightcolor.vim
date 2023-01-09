" this file is for highlight color
" update by chenxuan 2023-01-09 11:09:23

let s:regex="\\v#[0-9a-fA-F]{6}"
let b:hl_able=0
let b:hl_num=0
let b:hl_dict={}

func! s:HlDefine() abort
	let list=getbufline("%",1,"$")
	if !exists("b:hl_dict")||!exists("b:hl_num")
		let b:hl_num=0
		let b:hl_dict={}
	endif
	let line=1
	for now in list
		let match=matchstrpos(now,s:regex)
		while match[0]!=""
			let hl_flag=b:hl_num
			if !has_key(b:hl_dict,match[0])
				let guifg="#000000"
				if match[0]==guifg
					let guifg="#FFFFFF"
				endif
				exec ":highlight HlColor".b:hl_num." guibg=".match[0]." guifg=".guifg
				let b:hl_dict[match[0]]={"hl_num": b:hl_num,"hl_arr":[]}
				let b:hl_num+=1
				let m=matchadd("HlColor".hl_flag,match[0])
				call add(b:hl_dict[match[0]]["hl_arr"],m)
			endif
			let match=matchstrpos(now,s:regex,match[2]+1)
		endwhile
		let line+=1
	endfor
endfunc

func! highlightcolor#Able()
	if exists("b:hl_able")&&b:hl_able
		return
	endif
	let b:hl_able=1
	call s:HlDefine()
endfunc


func! highlightcolor#DisAble()
	if !exists("b:hl_able")||b:hl_able==0
		return
	endif

	for [key,val] in items(b:hl_dict)
		let m="HlColor".val["hl_num"]
		for temp in val["hl_arr"]
			call matchdelete(temp)
		endfor
		highlight clear m
	endfor
	let b:hl_dict={}
	let b:hl_able=0
endfunc
