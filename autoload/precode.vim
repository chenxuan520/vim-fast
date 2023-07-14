"======================================================================
"
" editorconfig
"
" Created by chenxuan on 2023-07-14 13:21
"
"======================================================================

let s:pathprefix=$HOME."/.vim/ftplugin/template/"


function! ReadTemplateFile(suffix) abort
	let suffix=a:suffix
	let path=s:pathprefix."template.".suffix
	if findfile(path)==""
		return
	endif
	let content = readfile(path)
	if len(content)==0
		return
	endif
	call append(0,content)
endfunction

function precode#CreateCode() abort
	let filename=split(expand('%:p'),'\.')[-1]
	call ReadTemplateFile(filename)
endfunction
