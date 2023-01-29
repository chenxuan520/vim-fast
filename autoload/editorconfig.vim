"======================================================================
"
" editorconfig
"
" Created by chenxuan on 2023-01-29 09:34
"
"======================================================================

let s:editorconfigdict={}
let s:pathprefix=""

func! s:FindConfig()
	return findfile(".editorconfig", getcwd() .';')
endfunc

func! s:FindRoot()
	let s:gitdir = finddir(".git", getcwd() .';')
	if !empty(s:gitdir)
		if s:gitdir==".git"|let s:gitdir=getcwd()
		else|let s:gitdir=strpart(s:gitdir,0,strridx(s:gitdir,"/"))
		endif
		return s:gitdir
	endif
	return ""
endfunc

func! s:SetOptions(key,val)abort
	let key=a:key|let val=a:val
	if key==?'indent_style'
		if val==?"tab"
			setlocal noexpandtab
		elseif val==?"space"
			setlocal expandtab
		else
			echom "unknown ".val
		endif
	elseif key==?'tab_width'
		execute ":setlocal tabstop=".val
	elseif key==?'indent_size'
		execute ":setlocal shiftwidth=".val
		execute ":setlocal softtabstop=".val
	endif
endfunc

func! s:AnalyseFile(file)abort
	if !filereadable(a:file)
		echohl WarningMsg|echo "cannot find .editorconfig file"|echohl NONE
		return
	endif
	let s:pathprefix=fnamemodify(a:file,":p:h")
	let nowkey=""|let nowdict={}
	for line in readfile(a:file)
		if line==""||line=~"^\\s*#"
			continue
		elseif line=~"^\\s*\\["
			let list=matchlist(line,"^\\s*\\[\\(.*[^]]\\)")
			if len(list)<2||list[0]==''
				continue
			endif
			if nowkey!=""&&len(nowdict)!=0
				let s:editorconfigdict[nowkey]=nowdict
			endif
			let nowkey=list[1]|let nowdict={}
		elseif line=~"^\\s*[a-zA-Z_]*"
			let list=matchlist(line,"^\\s*\\([0-9a-zA-Z_-]*\\)\\s*=\\s*\\([0-9a-zA-Z_-]*\\)")
			if len(list)<3||list[0]==''
				continue
			endif
			let nowdict[list[1]]=list[2]
		else
			echom line." unknown config"
		endif
	endfor
	if nowkey!=""&&len(nowdict)!=0
		let s:editorconfigdict[nowkey]=nowdict
	endif
endfunc

func! s:Clear()abort
	silent! autocmd! EditorConfig
	let s:editorconfigdict={}
	let s:pathprefix=""
endfunc

func! editorconfig#Run()abort
	if s:pathprefix==""||stridx(expand('%:p:h'),s:pathprefix)==-1
		return
	endif
	for [key,val] in items(s:editorconfigdict)
		if expand('%')=~glob2regpat(key)
			for [k1,v1] in items(val)
				call s:SetOptions(k1,v1)
			endfor
			break
		endif
	endfor
endfunc

func! editorconfig#Able()abort
	call s:AnalyseFile(s:FindConfig())
	if len(s:editorconfigdict)!=0
		augroup EditorConfig
			autocmd!
			autocmd BufReadPost * call editorconfig#Run()
			autocmd BufNewFile *  call editorconfig#Run()
		augroup END
		echomsg "load success"
	endif
endfunc

func! editorconfig#Disable()abort
	call s:Clear()
	echo "clear success"
endfunc

func! editorconfig#EditconfigFile()abort
	let name=s:FindConfig()|let flag=0
	if name==""
		let flag=1
		let temp=s:FindRoot()."/"
		if temp=="/"|let name=".editorconfig"
		else|let name=temp.".editorconfig"
		endif
	endif
	exec ":edit ".name
	if flag
		call append(line('.')-1, "# this is a example for editorconfig")
		call append(line('.')-1, "")
		call append(line('.')-1, "root = true")
		call append(line('.')-1, "")
		call append(line('.')-1, "[*]")
		call append(line('.')-1, "indent_style = tab")
		call append(line('.')-1, "tab_width = 4")
	endif
endfunc
