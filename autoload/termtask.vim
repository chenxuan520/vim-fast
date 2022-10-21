func! s:FindConfigWay()
	let s:gitdir=getcwd()."/"
	while strridx(s:gitdir,"/")!=-1
		let s:gitdir=strpart(s:gitdir,0,strridx(s:gitdir,"/"))
		if isdirectory(s:gitdir . "/.git")
			break
		endif
	endwhile
	if strridx(s:gitdir,"/")==-1
		return ""
	endif
	let s:gitdir=s:gitdir."/.config.vim"
	return s:gitdir
endfunc

func! s:FindRoot()
	let s:gitdir=getcwd()."/"
	while strridx(s:gitdir,"/")!=-1
		let s:gitdir=strpart(s:gitdir,0,strridx(s:gitdir,"/"))
		if isdirectory(s:gitdir . "/.git")
			break
		endif
	endwhile
	if strridx(s:gitdir,"/")==-1
		return ""
	endif
	return s:gitdir
endfunc

function! s:Term_read(name)
	let s:options={}
	for s:task in g:Term_project_task
		if a:name!=""
			if !has_key(s:task,'name')||s:task['name']!=a:name
				continue
			endif
		endif

		if !has_key(s:task,'command')
			echo 'command is null'
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
			let g:asyncrun_exit="cclose|" . g:asyncrun_exit
		endif
		if has_key(s:task,'close')&&s:task['close']
			let s:options['term_finish']='close'
		endif

		if has_key(s:task,'quickfix')&&s:task['quickfix']
			call asyncrun#run("",s:options,s:task['command'])

			return
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
endfunction

function! termtask#Term_task_run(name)
	if filereadable(s:FindConfigWay())
		execute ":source ". s:gitdir
		echo "load success"
	else
		echo "no config file"
		return
	endif
	for s:task in g:Term_project_task
		if has_key(s:task,'key')&&has_key(s:task,'name')&&s:task['key']!=''
			execute ":nnoremap " . s:task['key'] . ' :call <sid>Term_read("' . s:task['name'] . '")<cr>'
		else
			echo "task is no completed"
		endif
	endfor
	call <sid>Term_read(a:name)
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
