"======================================================================
"
" termtask
"
" Created by chenxuan on 2022.10.18
"
"======================================================================

let s:dictname={}
let g:term_exit_code=0
let s:term_fin_exec=""

func! s:FindConfigWay()
	return findfile(".config.vim",getcwd().';')
endfunc

func! s:FindRoot()
	let temp = finddir(".git", getcwd() .';')
	if !empty(temp)
		if temp==".git"
			let temp=getcwd()
		else
			let temp=strpart(temp,0,strridx(temp,"/"))
		endif
		return temp
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
		let g:Term_project_task[index]['end_script']=''
	endif
	let g:Term_project_task[index]['next']=dict['next']
	call s:Term_read(dict['begin'])
	return
endfunc

function! s:Term_read(name)
	let s:options={}
	let s:term_fin_exec=""
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
			elseif s:task['mode']=='shell'
				if !has_key(s:task,'command')
					echom s:task['name'].' command is null'
					return
				endif
				echo system(s:task['command'])
				let g:term_exit_code=0
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

		if has_key(s:task, 'next')&&s:task['next']!=''
			let g:asyncrun_exit="if g:asyncrun_code==0|cclose|call termtask#Term_task_run('".s:task['next']."')|endif|"
			let s:term_fin_exec="if g:term_exit_code==0|call termtask#Term_task_run('".s:task['next']."')|endif"
		endif

		if has_key(s:task,'quickfix')&&s:task['quickfix']

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

		" TODO: avoid string ; "
		if stridx(s:task['command'],';')!=-1&&get(s:task,'close',2)!=2
			let s:task['command']='bash -c "'.s:task['command'].'"'
		endif

		if has_key(s:task,'end_script')
			let s:options['exit_cb']="termtask#Term_Cb"
			let s:term_fin_exec=s:term_fin_exec.s:task['end_script']
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

		break
	endfor

	if !s:exist
		echo 'no this task name'
	endif

endfunction

function! termtask#Term_task_run(name) abort
	let s:dictname={}|let i=0|let temp=s:FindConfigWay()
	if filereadable(temp)
		execute ":source ". temp
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

fun! termtask#Term_Cb(chan,msg)
	let g:term_exit_code=a:msg
	echom a:msg
	if s:term_fin_exec!=''
		exec s:term_fin_exec
	endif
endfun

" read diff config for diff project
func! termtask#Term_config_edit()
	let config=s:FindConfigWay()
	if config!=""
		execute ":edit ".config
	else
		let temp=s:FindRoot()
		if temp!=""
			execute ":edit ".temp."/.config.vim"
		else
			edit .config.vim
			redraw
			echohl WarningMsg|echom "cannot not find .git dir,create config in pwd"|echohl NONE
		endif
	endif
endfunc

" read from git dir
func! termtask#Term_get_dir()
	let root=s:FindRoot()
	return root==""?getcwd():root
endfunc

" get task list
func! termtask#Term_task_list(A,C,P)
	let temp=s:FindConfigWay()
	if filereadable(temp)
		execute ":source ".temp
	else
		echohl WarningMsg|echo "no config file"|echohl NONE
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
