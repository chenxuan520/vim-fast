"======================================================================
"
" Created by chenxuan on 2023.1.2
"
"======================================================================
"
let s:input=''
let s:is_continue=1

func! CallBack(timer)
	let s:is_continue=0
	echo "detect key: ".s:input
	if s:input!=''
		exec ":echo 'vis/nor/sel/oper model'|verbose map ".s:input."|echo 'insert/command model'|verbose map! ".s:input
		echo ""
	else
		echo 'empty input,enter <cr> exit'
	endif
endfunc

func! findkey#get_key_msg()
	let s:input=''
	let s:is_continue=1
	let first_extra_time=300
	echo 'key code detecting...'
	while s:is_continue
		let timer=timer_start(&timeoutlen+first_extra_time,'CallBack')
		let temp=getchar()
		call timer_stop(timer)
		if type(temp)==1
			" too many left there if need,add self
			if temp=="\<bs>"
				let s:input=s:input."<bs>"
			elseif temp=="\<s-tab>"
				let s:input=s:input."<s-tab>"
			elseif temp=="\<leftmouse>"
				let s:input=s:input."<leftmouse>"
			elseif temp=="\<c-leftmouse>"
				let s:input=s:input."<c-leftmouse>"
			elseif temp=="\<rightmouse>"
				let s:input=s:input."<rightmouse>"
			elseif temp=="\<c-rightmouse>"
				let s:input=s:input."<c-rightmouse>"
			endif
		elseif temp==13
			if s:is_continue
				let s:input=s:input."<c-m>"
			endif
		elseif temp==27
			let s:is_continue=0
			echo "cancel operator"
			return
		elseif temp<27
			let s:input=s:input."<c-".nr2char(temp+96).">"
		elseif temp<30&&temp>27
			let s:input=s:input."<c-".nr2char(temp+64).">"
		elseif temp==char2nr(g:mapleader)
			let s:input=s:input."<leader>"
		elseif temp==32
			let s:input=s:input."<space>"
		else
			let s:input=s:input . nr2char(temp)
		endif
		let first_extra_time=0
	endwhile
endfunc
