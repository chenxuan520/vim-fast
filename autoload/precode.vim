"======================================================================
"
" editorconfig
"
" Created by chenxuan on 2023-07-14 13:21
"
"======================================================================

let s:pathprefix="~/.vim/ftplugin/template/"


function! ReadTemplateFile(suffix) abort
	let suffix=a:suffix
	let file=findfile(s:pathprefix."template.".suffix)
	if empty(file)
		return
	endif
endfunction
