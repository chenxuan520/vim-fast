"======================================================================
"
" termtask
"
" Created by chenxuan on 2022.10.18
"
"======================================================================

let s:dictname={}
func! s:FindConfigWay()
	let s:gitdir = finddir(".git", getcwd() .';')
	if !empty(s:gitdir)
		if s:gitdir==".git"
			let s:gitdir=getcwd()
		else
			let s:gitdir=strpart(s:gitdir,0,strridx(s:gitdir,"/"))
		endif
		let s:gitdir=s:gitdir."/.config.vim"
		return s:gitdir
	endif
	return ""
	" let s:gitdir=getcwd()."/"
	" while strridx(s:gitdir,"/")!=-1
	" 	let s:gitdir=strpart(s:gitdir,0,strridx(s:gitdir,"/"))
	" 	if isdirectory(s:gitdir . "/.git")
	" 		break
	" 	endif
	" endwhile
	" if strridx(s:gitdir,"/")==-1
	" 	return ""
	" endif
	" let s:gitdir=s:gitdir."/.config.vim"
	" return s:gitdir
endfunc

func! s:FindRoot()
	let s:gitdir = finddir(".git", getcwd() .';')
	if !empty(s:gitdir)
		if s:gitdir==".git"
			let s:gitdir=getcwd()
		else
			let s:gitdir=strpart(s:gitdir,0,strridx(s:gitdir,"/"))
		endif
		return s:gitdir
	endif
	return ""
	" let s:gitdir=getcwd()."/"
	" while strridx(s:gitdir,"/")!=-1
	" 	let s:gitdir=strpart(s:gitdir,0,strridx(s:gitdir,"/"))
	" 	if isdirectory(s:gitdir . "/.git")
	" 		break
	" 	endif
	" endwhile
	" if strridx(s:gitdir,"/")==-1
	" 	return ""
	" endif
	" return s:gitdir
endfunc

func! s:Workflow(dict) abort
	let dict=a:dict
	if !has_key(dict,'begin')||!has_key(dict,'next')
		echom 'define no ok'
		return
	endif
	if !has_key(s:dictname,dict['begin'])||!has_key(s:dictname,dict['next'])
		echoerr 'no such task'
		return
	endif
	let begin=s:dictname[dict['begin']]|let index=begin['index']
	if get(begin,'quickfix',0)==0&&get(begin,'mode','')!='quickfix'
		echoerr 'begin is not a quick func'
		return
	endif
	let g:Term_project_task[index]['next']=dict['next']
	call s:Term_read(dict['begin'])
	return
endfunc

function! s:Term_read(name)
	let s:options={}
	let s:exist=0

	for s:task in g:Term_project_task
		if a:name!=""
			if !has_key(s:task,'name')||s:task['name']!=a:name
				continue
			endif
		endif

		let s:exist=1

		if has_key(s:task, 'mode')
			if s:task['mode']=='quickfix'
				let s:task['quickfix']=1
			elseif s:task['mode']=='term'
				let s:task['quickfix']=0
			elseif s:task['mode']=='workflow'
				call s:Workflow(s:task)
				return
			else
				echom "unknown task mode"
				return
			endif
		endif

		if !has_key(s:task,'command')
			echom s:task['name'].' command is null'
			return
		endif

		let s:path=expand('%:p:h')
		if has_key(s:task,'path')
			let s:path=s:task['path']
		endif
		let s:options['cwd']=s:path

		if has_key(s:task,'pre_script')&&s:task['pre_script']!=''
			execute s:task['pre_script']
		endif

		if has_key(s:task,'end_script')
			let g:asyncrun_exit=s:task['end_script']
		else
			let g:asyncrun_exit=""
		endif

		if has_key(s:task,'close')&&s:task['close']
			if s:task['close']==1
				let g:asyncrun_exit="cclose|" . g:asyncrun_exit
			elseif s:task['close']==2
				let g:asyncrun_exit="if g:asyncrun_code==0|cclose|endif|" . g:asyncrun_exit
			elseif s:task['close']==3
				let s:height=get(g:,"asyncrun_open",6)
				let g:asyncrun_open=0
				let g:asyncrun_exit="let g:asyncrun_open = ".s:height."|copen|" . g:asyncrun_exit
			endif
		endif

		if has_key(s:task,'quickfix')&&s:task['quickfix']
			if has_key(s:task, 'next')&&s:task['next']!=''
				let g:asyncrun_exit="if g:asyncrun_code==0|cclose|call termtask#Term_task_run('".s:task['next']."')|endif|"
			endif

			if has_key(s:task,'type')&&s:task['type']=='tab'
				let s:options['pos']='tab'
			elseif has_key(s:task,'type')&&s:task['type']=='vsplit'
				let s:options['pos']='left'
			endif

			call asyncrun#run("",s:options,s:task['command'])
			return
		endif

		if has_key(s:task,'close')&&s:task['close']
			if s:task['close']==1
				let s:options['term_finish']='close'
			elseif s:task['close']==2
				let s:task['command']='bash -c "'.s:task['command'].' || bash"'
				let s:options['term_finish']='close'
			elseif s:task['close']==3
				let s:options['hidden']=1
				let s:options['term_finish']='open'
			endif
		endif

		if has_key(s:task,'type')&&s:task['type']=='tab'
			execute ':tabe'
			let s:options['curwin']=1
			call term_start(s:task['command'],s:options)
		elseif has_key(s:task,'type')&&s:task['type']=='vsplit'
			vert call term_start(s:task['command'],s:options)
		else
			call term_start(s:task['command'],s:options)
		endif

		if has_key(s:task,'end_script')&&s:task['end_script']!=''
			execute s:task['end_script']
		endif

		break
	endfor

	if !s:exist
		echo 'no this task name'
	endif

endfunction

function! termtask#Term_task_run(name) abort
	let s:dictname={}|let i=0
	if filereadable(s:FindConfigWay())
		execute ":source ". s:gitdir
		echo "load success"
	else
		echohl WarningMsg
		echo "no config file"
		echohl NONE
		return
	endif
	for s:task in g:Term_project_task
		if !has_key(s:task,'name')||s:task['name']==''
			echoerr "task need name"
			return
		endif
		if has_key(s:task,'key')&&s:task['key']!=''
			execute ":nnoremap " . s:task['key'] . ' :call <sid>Term_read("' . s:task['name'] . '")<cr>'
		endif
		let s:dictname[s:task["name"]]=s:task|let s:dictname[s:task["name"]]["index"]=i
		let i+=1
	endfor
	if a:name!=''
		call s:Term_read(a:name)
	endif
endfunction

" read diff config for diff project
func! termtask#Term_config_edit()
	let s:git_dir=s:FindConfigWay()
	if s:git_dir!=""
		execute ":edit ".s:FindConfigWay()
	else
		echo "can not find .git dir"
	endif
endfunc

" read from git dir
func! termtask#Term_get_dir()
	return s:FindRoot()
endfunc

" get task list
func! termtask#Term_task_list(A,C,P)
	if filereadable(s:FindConfigWay())
		execute ":source ". s:gitdir
	else
		echohl WarningMsg
		echo "no config file"
		echohl NONE
		return
	endif

	let s:list=[]
	for s:task in g:Term_project_task
		if has_key(s:task,'name')
			let s:list=add(s:list,s:task['name'])
		endif
	endfor

	if len(a:A)!=0
		let temp=[]
		for task in s:list
			if match(task,"^".a:A)!=-1
				let temp=add(temp,task)
			endif
		endfor
		let s:list=temp
	endif
	return s:list
endfunc

" set cmd task
func! termtask#Term_cmd_exec(mode)
	if a:mode=='v'
		norm! gv"sy
	else
		let @s=expand('<cword>')
	endif
	let s:cmd=get(g:,"term_cmd","")
	if s:cmd==""|echo "cmd no define"|return
	endif
	echo system(s:cmd.' "'.@s.'"')
endfunc

" set cmd popup
func! termtask#Term_cmd_exec_popup(mode)
	if a:mode=='v'
		norm! gv"sy
	else
		let @s=expand('<cword>')
	endif
	let s:cmd=get(g:,"term_cmd","")
	if s:cmd==""|echo "cmd no define"|return
	endif
	let result=system(s:cmd.' "'.@s.'"')
	let text=split(result,"\n")
	if result==""|let text="no message"|endif
	call popup_atcursor(text,{})
endfunc
