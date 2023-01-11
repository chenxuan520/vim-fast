"======================================================================
"
" Created by chenxuan on 2023.1.2
"
"======================================================================
"
let s:input=''
let s:is_continue=1
let s:last_change_file=[]
let s:last_change_now=0
let s:direct_file=0

func! findkey#open_file(direct) abort
	if !exists("s:input")||len(s:input)==0
		echo "first find key first"
		return
	endif
	if !exists("s:last_change_file")||len(s:last_change_file)==0
		let s:last_change_file=[]
		let list=split(execute(":verbose map ".s:input."| verbose map! ".s:input,"silent"),'\n')
		for now in list
			let str=matchlist(now,"\\~\\?/\\S* line \\d*")
			if len(str)==0
				continue
			endif
			let msg=split(str[0])
			call add(s:last_change_file,{"file":msg[0],"line":msg[2]})
		endfor
		let s:last_change_now=-1
	endif
	if len(s:last_change_file)==0
		echo "nofind"
		return
	endif
	if a:direct==1
		let s:last_change_now+=1
		if s:last_change_now>=len(s:last_change_file)
			let s:last_change_now=0
		endif
	else
		let s:last_change_now-=1
		if s:last_change_now<0
			let s:last_change_now=len(s:last_change_file)-1
		endif
	endif
	exec "edit".s:last_change_file[s:last_change_now]["file"]
	call cursor(s:last_change_file[s:last_change_now]["line"],0)
	exec "normal! zz"
	if exists("s:direct_file")&&s:direct_file
		redraw!
	endif
endfunc

func! CallBack(timer)
	if get(g:,"findkey_mode",1)
		let s:is_continue=0
	elseif s:is_continue==1
		return
	endif
	if s:direct_file
		call findkey#open_file(1)
		return
	endif
	redraw!
	echo "detect key: ".s:input
	echohl WarningMsg
	if s:input!=''
		exec ":echo 'vis/nor/sel/oper model'|verbose map ".s:input."|echo 'insert/command model'|verbose map! ".s:input
		echo ""
	else
		echo 'empty input,enter <cr> exit'
	endif
	echohl NONE
endfunc

func! findkey#get_key_msg(direct)
	let s:input=''
	let s:last_change_file=[]
	let s:is_continue=1
	let s:direct_file=a:direct
	let first_extra_time=300

	if get(g:,"findkey_mode",1)
		echo 'key code detecting...'
	else
		echo 'key code detecting(<esc>/<cr> to end)...'
	endif

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
			if !get(g:,"findkey_mode",1)
				let s:is_continue=0
				call CallBack(timer)
				return
			endif

			if s:is_continue
				let s:input=s:input."<c-m>"
			endif
		elseif temp==27
			let s:is_continue=0
			if !get(g:,"findkey_mode",1)
				call CallBack(timer)
			else
				echo "cancel operator"
			endif
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
		if s:input!=""&&s:is_continue
			redraw!
			echo 'get key:'.s:input
		endif
		let first_extra_time=0
	endwhile
endfunc
