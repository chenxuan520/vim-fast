"======================================================================
"
" gitguttersimple
"
" Created by chenxuan on 2022.12.18
"
"======================================================================
"
let s:regex = '^@@ -\(\d\+\),\?\(\d*\) +\(\d\+\),\?\(\d*\) @@'
let s:sign_id=3
let s:sign_group_name= 'gutter'
let b:buffer_gitgutter=[]
let b:git_gutter_status=0

func! gutter#GitGutterDiff()
	let now_line=line('.')
	if len(b:buffer_gitgutter)==0
		echo 'git gutter not open yet'
		return
	endif
	let s:lines=system('git diff -U0 '.expand('%:p'))
	let s:list=split(s:lines,'\n')
	let result=''
	let i=0
	while i<len(s:list)
		let s:line=s:list[i]
		let matches = matchlist(s:line, s:regex)
		if len(matches)>0
			let new_line     = str2nr(matches[3])
			let new_change   = (matches[4] == '') ? 1 : str2nr(matches[4])
			let b:buffer_gitgutter=add(b:buffer_gitgutter,new_line)
		else
			let i+=1
			continue
		endif
		if new_line<=now_line&&new_change+new_line>=now_line
			" let result=s:line
			echohl GitGutterChange
			echo s:line
			echohl NONE

			let j=i+1
			while j<len(s:list)
				let s:line=s:list[j]
				let matches = matchlist(s:line, s:regex)
				if len(matches)>0
					break
				endif

				" let result=result."\n".s:line
				if match(s:line,"^+")!=-1
					echohl GitGutterAdd
				elseif match(s:line,"^-")!=-1
					echohl GitGutterDelete
				else
					echohl GitGutterChange
				endif
				echo s:list[j]
				echohl NONE

				let j+=1
			endwhile
			return
		endif
		let i+=1
	endwhile
	echo "not match result"
	" echo result
endfunc

func! gutter#GitGutterRecover()
	let now_line=line('.')
	if len(b:buffer_gitgutter)==0
		echo 'git gutter not open yet'
		return
	endif
	let s:lines=system('git diff -U0 '.expand('%:p'))
	let s:list=split(s:lines,'\n')
	let result=''
	let i=0
	while i<len(s:list)
		let s:line=s:list[i]
		let matches = matchlist(s:line, s:regex)
		if len(matches)>0
			let new_line     = str2nr(matches[3])
			let new_change   = (matches[4] == '') ? 1 : str2nr(matches[4])
			let b:buffer_gitgutter=add(b:buffer_gitgutter,new_line)
		else
			let i+=1
			continue
		endif
		if new_line<=now_line&&new_change+new_line>=now_line
			if new_change>0
				call deletebufline(bufnr(),new_line,new_change+new_line-1)
			endif
			let add_list=[]
			let add_num=0
			if new_change!=0
				let add_num-=1
			endif

			let j=i+1
			while j<len(s:list)
				let s:line=s:list[j]
				let matches = matchlist(s:line, s:regex)
				if len(matches)>0
					break
				endif

				if match(s:line,"^-")!=-1
					call add(add_list,s:line[1:-1])
				else
					break
				endif

				let j+=1
			endwhile
			call append(new_line+add_num,add_list)
			write
			call gutter#GitGutterAble()
			return
		endif
		let i+=1
	endwhile
	echo "not match result"
	" echo result
endfunc

func! gutter#GitGutterAble()
	" judge if save
	if &modified
		if input("not save the buffer,save buffer?(y/n):")==?"y"
			write
		else
			echo "\nnot save buffer,exit the operator"
			return
		endif
	endif
	" clear
	let b:buffer_gitgutter=[]
	call s:ClearSign()

	let g:gitgutter_status=get(g:,'gitgutter_status',0)
	if g:gitgutter_status==0
		let g:gitgutter_status=1
		call s:SignDefine()
	endif
	let s:lines=system('git diff -U0 '.expand('%:p').' | grep "^@@"')
	let s:list=split(s:lines,'\n')
	for s:line in s:list
		let matches = matchlist(s:line, s:regex)
		if len(matches)>0
			let old_line     = str2nr(matches[1])
			let old_change   = (matches[2] == '') ? 1 : str2nr(matches[2])
			let new_line     = str2nr(matches[3])
			let new_change   = (matches[4] == '') ? 1 : str2nr(matches[4])
			let b:buffer_gitgutter=add(b:buffer_gitgutter,new_line)
		else
			echohl WarningMsg
			echo "get git status wrong,please check exist .git dir and grep cmd is ok"
			echohl None
			return
		endif
		if new_change>old_change
			let i=new_change
			while i>0
				call sign_place(s:sign_id,s:sign_group_name,'gitadd',expand('%:p'),{'lnum':new_line+i-1,'priority':1})
				let i-=1
			endwhile
		elseif new_change==old_change
			let i=new_change
			while i>0
				call sign_place(s:sign_id,s:sign_group_name,'gitchange',expand('%:p'),{'lnum':new_line+i-1,'priority':1})
				let i-=1
			endwhile
		else
			call sign_place(s:sign_id,s:sign_group_name,'gitdelete',expand('%:p'),{'lnum':new_line,'priority':1})
		endif
	endfor

	augroup GitGutterCmd
		au!
		autocmd BufWritePost <buffer> call gutter#GitGutterAble()
	augroup END

	let b:git_gutter_status=1
endfunc

func! gutter#GitGutterDisable()
	call s:ClearSign()

	if b:git_gutter_status
		silent au! GitGutterCmd
		silent augroup! GitGutterCmd
	endif

	let b:git_gutter_status=0
endfunc

func! s:ClearSign()
	call sign_unplace(s:sign_group_name,{'buffer':expand('%:p')})
	let b:buffer_gitgutter=[]
endfunc

func! s:SignDefine()
	highlight GitGutterAdd    font=#b9f27c
	highlight GitGutterDelete font=#ff7a93
	highlight GitGutterChange font=#7da6ff
	call sign_define([
				\ {
				\	'name':'gitadd',
				\	'text':'+',
				\	'texthl':'GitGutterAdd'
				\ },
				\ {
				\	'name':'gitdelete',
				\	'text':'-',
				\	'texthl':'GitGutterDelete',
				\ },
				\ {
				\	'name':'gitchange',
				\	'text':'~',
				\	'texthl':'GitGutterChange',
				\ },
				\])
endfunc

func! gutter#GitGutterChangeTurn(direct,now)
	if len(b:buffer_gitgutter)==0
		echo 'no change list'
		return
	endif
	if a:direct==1
		if a:now>=b:buffer_gitgutter[-1]
			echo 'the last,again from first'
			call cursor(b:buffer_gitgutter[0],0)
			return
		else
			for i in b:buffer_gitgutter
				if i>a:now
					call cursor(i,0)
					return
				endif
			endfor
		endif
	elseif a:direct==0
		if a:now<=b:buffer_gitgutter[0]
			echo 'the first,again from last'
			call cursor(b:buffer_gitgutter[-1],0)
			return
		else
			let i=len(b:buffer_gitgutter)-1
			while i>=0
				if b:buffer_gitgutter[i]<a:now
					call cursor(b:buffer_gitgutter[i],0)
					return
				endif
				let i-=1
			endwhile
		endif
	endif
endfunc
